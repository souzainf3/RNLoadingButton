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
    IBOutlet RNLoadingButton *btn1;
    IBOutlet RNLoadingButton *btn2;
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
    
    btn1.hideTextWhenLoading = NO;
    btn1.loading = NO;
    [btn1 setActivityIndicatorAlignment:RNLoadingButtonAlignmentRight];
    btn1.activityIndicatorEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 10);
    [btn1 setTitleColor:[UIColor colorWithWhite:0.673 alpha:1.0] forState: UIControlStateDisabled];
    [btn1 setTitle:@"connecting           " forState:UIControlStateDisabled];
    
    
    btn2.hideTextWhenLoading = NO;
    btn2.loading = NO;
    [btn2 setActivityIndicatorAlignment:RNLoadingButtonAlignmentLeft];
    [btn2 setActivityIndicatorStyle:UIActivityIndicatorViewStyleGray forState:UIControlStateDisabled];
    btn2.activityIndicatorEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btn2 setTitle:@"Loading" forState:UIControlStateDisabled];
    
}

- (IBAction) buttonTapAction:(RNLoadingButton *)button {
    
    button.loading = !button.loading;
    [button setActivityIndicatorAlignment:RNLoadingButtonAlignmentCenter];
    button.hideImageWhenLoading = YES;
    
}


- (IBAction) doTap:(RNLoadingButton *)sender {
    
    sender.enabled = NO;
    sender.loading = YES;
    
    if (sender.tag == 3) {
        sender.hideImageWhenLoading = YES;
    }
    
        
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.enabled = YES;
        sender.loading = NO;
        
        if (sender.tag == 3) {
            sender.selected = !sender.selected;
        }
    });

}


@end
