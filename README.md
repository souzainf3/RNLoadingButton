# RNLoadingButton


## Purpose

An easy-to-use UIButton subclass that implements a loading with aligment options.

##### Let's see example

![Screenshot:](Assets/example1.gif)

## Requirements
iOS 5

## Installation

### Cocoapods
RNLoadingButton is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod 'RNLoadingButton', '~> 0.0.1'

### Source
To run the example project; clone the repo, and open the demo project


## Usage

#### \#import "RNLoadingButton.h"

```objective-c
    btnLeftLoading.hideTextWhenLoading = NO;
    btnLeftLoading.loading = YES;
    [btnLeftLoading setActivityIndicatorAlignment:(RNLoadingButtonAlignmentLeft)];
    [btnLeftLoading setActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray) forState:(UIControlStateDisabled)];
//    btnFacebook.activityIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
```


## Author

Romilson Nunes, souzainf3@yahoo.com.br

## License

RNLoadingButton is available under the MIT license. See the LICENSE file for more info.

