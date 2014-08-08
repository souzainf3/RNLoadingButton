//
//  RNLoadingButton.h
//
//  Created by Romilson on 22/04/13.
//  Copyright (c) 2013 Romilson Nunes. All rights reserved.
//

#import <UIKit/UIKit.h>

/* Values for NSTextAlignment */


typedef enum {
    RNLoadingButtonAlignmentLeft      = 0,
    RNLoadingButtonAlignmentCenter    = 1,
    RNLoadingButtonAlignmentRight     = 2,
} RNLoadingButtonAlignment;


@interface RNLoadingButton : UIButton

@property (nonatomic, readwrite) BOOL loading;

@property(nonatomic, readonly) UIActivityIndicatorView *activityIndicator;

@property(nonatomic) UIEdgeInsets activityIndicatorEdgeInsets; // default is UIEdgeInsetsZero

@property(nonatomic, readwrite) BOOL hideImageWhenLoading; // Default YES
@property(nonatomic, readwrite) BOOL hideTextWhenLoading; // Default YES

- (void)setActivityIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle forState:(UIControlState)__state;
- (UIActivityIndicatorViewStyle)activityIndicatorStyleForState:(UIControlState)__state;
- (void)setActivityIndicatorAlignment:(RNLoadingButtonAlignment)_aligment;

@end
