# RNLoadingButton


Used in [Zee - Personal Finances](https://itunes.apple.com/us/app/id422694086).


![https://itunes.apple.com/us/app/id422694086](https://raw.githubusercontent.com/souzainf3/RNActivityView/master/Demo/Screens/qrcode.png)


An easy-to-use UIButton subclass with an activity indicator.

The activity state is configurable and can hide the image or text while the activity indicator is displaying .
You can Also choose the position of easily activity indicator or Set It up with a spacing.

[![](https://raw.githubusercontent.com/souzainf3/RNLoadingButton-Swift/master/RNLoadingButtonDemo/Screens/screen1.png)](https://raw.githubusercontent.com/souzainf3/RNLoadingButton-Swift/master/RNLoadingButtonDemo/Screens/screen1.png)
[![](https://raw.githubusercontent.com/souzainf3/RNLoadingButton-Swift/master/RNLoadingButtonDemo/Screens/screen2.png)](https://raw.githubusercontent.com/souzainf3/RNLoadingButton-Swift/master/RNLoadingButtonDemo/Screens/screen2.png)


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

