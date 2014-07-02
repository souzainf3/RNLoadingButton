//
//  ViewController.m
//  RNLoadingButtonDemo
//
//  Created by Romilson Nunes on 02/07/14.
//  Copyright (c) 2014 Romilson Nunes. All rights reserved.
//

#import "ViewController.h"
#import "RNLoadingButton.h"

@interface ViewController () {
    IBOutlet RNLoadingButton *btnLeftLoading;
    IBOutlet RNLoadingButton *btnRightLoading;
    IBOutlet RNLoadingButton *btnCenterLoading;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setup {
    
    btnLeftLoading.hideTextWhenLoading = NO;
    btnLeftLoading.loading = YES;
    [btnLeftLoading setActivityIndicatorAlignment:(RNLoadingButtonAlignmentLeft)];
    [btnLeftLoading setActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray) forState:(UIControlStateDisabled)];
//    btnFacebook.activityIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    
    
    btnRightLoading.hideTextWhenLoading = NO;
    btnRightLoading.loading = YES;
    [btnRightLoading setActivityIndicatorAlignment:(RNLoadingButtonAlignmentRight)];
    [btnRightLoading setActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray) forState:(UIControlStateDisabled)];
    btnRightLoading.activityIndicatorEdgeInsets = UIEdgeInsetsMake(0, 200, 0, 10);              // default is UIEdgeInsetsZero
    [btnRightLoading setTitle:@"Disabled state" forState:UIControlStateDisabled];
    [btnRightLoading setTitleColor:[UIColor colorWithWhite:0.673 alpha:1.000] forState:UIControlStateDisabled];
    [btnRightLoading setEnabled:NO];
    
    
    btnCenterLoading.hideTextWhenLoading = YES;
    btnCenterLoading.loading = YES;
    [btnCenterLoading setActivityIndicatorAlignment:(RNLoadingButtonAlignmentCenter)];
    
}

@end
