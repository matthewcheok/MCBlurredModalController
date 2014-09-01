//
//  ModalViewController.m
//  Demo
//
//  Created by Matthew Cheok on 2/9/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "ModalViewController.h"
#import <MCBlurredModalController.h>

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor clearColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.blurredModalController dismiss];
}

@end
