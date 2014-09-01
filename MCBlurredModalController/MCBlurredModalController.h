//
//  MCBlurredModalController.h
//  Saleswhale
//
//  Created by Matthew Cheok on 9/7/14.
//  Copyright (c) 2014 Getting Real. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MCBlurredStyle) {
    MCBlurredStyleDark = 0,
    MCBlurredStyleLight,
    MCBlurredStyleExtraLight
};

typedef NS_ENUM(NSInteger, MCTransitionEffect) {
    MCTransitionEffectNone = 0,
    MCTransitionEffectScaling
};

@interface MCBlurredModalController : UIViewController

@property (nonatomic, strong, readonly) UIViewController *rootViewController;
@property (nonatomic, assign) MCBlurredStyle style;
@property (nonatomic, assign) MCTransitionEffect effect;

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;
- (void)presentInViewController:(UIViewController *)viewController;
- (void)dismiss;

@end

@interface UIViewController (MCBlurredModalController)

@property (nonatomic, strong, readonly) MCBlurredModalController *blurredModalController;

@end