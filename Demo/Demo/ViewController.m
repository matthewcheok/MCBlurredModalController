//
//  ViewController.m
//  Demo
//
//  Created by Matthew Cheok on 2/9/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "ViewController.h"
#import <MCBlurredModalController.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)handleModalButton:(id)sender {
    UIViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ModalViewController"];
    MCBlurredModalController *modalController = [[MCBlurredModalController alloc] initWithRootViewController:controller];
    modalController.style = MCBlurredStyleLight;
    [modalController presentInViewController:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
