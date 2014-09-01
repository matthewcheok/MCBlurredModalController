//
//  MCBlurredModalController.m
//  Saleswhale
//
//  Created by Matthew Cheok on 9/7/14.
//  Copyright (c) 2014 Getting Real. All rights reserved.
//

#import "MCBlurredModalController.h"
#import "UIImage+MCBlurredModalEffects.h"

@implementation UIView (MCBlurredModalInternal)

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)updates {
	UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
	[self drawViewHierarchyInRect:self.bounds afterScreenUpdates:updates];
    
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return image;
}

@end

@implementation UIViewController (MCBlurredModalInternal)

- (void)addToParentViewController:(UIViewController *)parentViewController inView:(UIView *)view callingAppearanceMethods:(BOOL)callAppearanceMethods {
	if (self.parentViewController != nil) {
		[self removeFromParentViewControllerCallingAppearanceMethods:callAppearanceMethods];
	}

	if (callAppearanceMethods)
		[self beginAppearanceTransition:YES animated:NO];
	[parentViewController addChildViewController:self];
	[view addSubview:self.view];
	[self didMoveToParentViewController:self];
	if (callAppearanceMethods)
		[self endAppearanceTransition];
}

- (void)removeFromParentViewControllerCallingAppearanceMethods:(BOOL)callAppearanceMethods {
	if (callAppearanceMethods)
		[self beginAppearanceTransition:NO animated:NO];
	[self willMoveToParentViewController:nil];
	[self.view removeFromSuperview];
	[self removeFromParentViewController];
	if (callAppearanceMethods)
		[self endAppearanceTransition];
}

@end

@interface MCBlurredModalController ()

@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation MCBlurredModalController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
	self = [super init];
	if (self) {
		_effect = MCTransitionEffectScaling;

		_rootViewController = rootViewController;
		_backgroundImageView = [[UIImageView alloc] init];

		self.view.backgroundColor = [UIColor clearColor];
		[self.view addSubview:_backgroundImageView];

		rootViewController.view.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (void)presentInViewController:(UIViewController *)viewController {
	UIImage *image = [viewController.view snapshotImageAfterScreenUpdates:NO];

	switch (self.style) {
		case MCBlurredStyleDark:
			image = [image mc_applyDarkEffect];
			break;

		case MCBlurredStyleLight:
			image = [image mc_applyLightEffect];
			break;

		case MCBlurredStyleExtraLight:
			image = [image mc_applyExtraLightEffect];
			break;

		default:
			break;
	}

	self.backgroundImageView.image = image;
	self.backgroundImageView.alpha = 0;

	self.view.frame = viewController.view.bounds;
	[self addToParentViewController:viewController inView:viewController.view callingAppearanceMethods:YES];
	[self.rootViewController addToParentViewController:self inView:self.view callingAppearanceMethods:YES];

	UIView *view = self.rootViewController.view;
	if (self.effect == MCTransitionEffectScaling) {
		view.alpha = 0;
		view.transform = CGAffineTransformMakeScale(1.2, 1.2);
	}
	[UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:kNilOptions animations: ^{
	    self.backgroundImageView.alpha = 1;
	    if (self.effect == MCTransitionEffectScaling) {
	        view.alpha = 1;
	        view.transform = CGAffineTransformIdentity;
		}
	} completion:nil];
}

- (void)dismiss {
	UIView *view = self.rootViewController.view;
	[UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0 options:kNilOptions animations: ^{
	    self.backgroundImageView.alpha = 0;
	    if (self.effect == MCTransitionEffectScaling) {
	        view.alpha = 0;
	        view.transform = CGAffineTransformMakeScale(1.2, 1.2);
		}
	} completion: ^(BOOL finished) {
	    [self.rootViewController removeFromParentViewControllerCallingAppearanceMethods:YES];
	    [self removeFromParentViewControllerCallingAppearanceMethods:YES];
	}];
}

#pragma mark - UIViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
	if (self.style == MCBlurredStyleDark) {
		return UIStatusBarStyleLightContent;
	}
	else {
		return UIStatusBarStyleDefault;
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];

	self.backgroundImageView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end

@implementation UIViewController (MCBlurredModalController)

- (MCBlurredModalController *)blurredModalController {
	UIViewController *parent = self.parentViewController;
	while (parent != nil && ![parent isKindOfClass:[MCBlurredModalController class]]) {
		parent = parent.parentViewController;
	}
	return (id)parent;
}

@end
