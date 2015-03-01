//
//  RNLoadingButton.m
//
//  Created by Romilson on 22/04/13.
//  Copyright (c) 2013 Romilson Nunes. All rights reserved.
//

#import "RNLoadingButton.h"

@interface RNLoadingButton(){
    RNLoadingButtonAlignment _activityIndicatorAlignment;
}


@property (retain, nonatomic) NSMutableDictionary *texts;
@property (retain, nonatomic) NSMutableDictionary *imagens;
@property (retain, nonatomic) NSMutableDictionary *indicatorStyles;

-(void)commonInit;

- (id) getValueFromDictionary:(NSMutableDictionary*)dictionary forControlState:(UIControlState)controlState;
- (void) setValue:(id)value inDictionary:(NSMutableDictionary*)dictionary forControlState:(UIControlState)controlState;
- (void) configureViewForControlState:(UIControlState)controlState;
- (UIControlState) currentControlState;

-(CGRect)frameForActivityIndicator;
-(void)activityIndicatorTaped:(id)sender;
-(void)setupActivityIndicator;

@end



@implementation RNLoadingButton
@synthesize loading=_loading;
@synthesize hideImageWhenLoading=_hideImageWhenLoading;
@synthesize hideTextWhenLoading =_hideTextWhenLoading;
@synthesize activityIndicator=_activityIndicator;
@synthesize activityIndicatorEdgeInsets = _activityIndicatorEdgeInsets;

@synthesize texts           = _texts;
@synthesize imagens         = _imagens;
@synthesize indicatorStyles = _indicatorStyles;



-(void)dealloc {
    
    [self removeObserver:self forKeyPath:@"self.state"];
    [self removeObserver:self forKeyPath:@"self.selected"];
    [self removeObserver:self forKeyPath:@"self.highlighted"];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setupActivityIndicator];
        [self commonInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self commonInit];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setupActivityIndicator {
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    [_activityIndicator setHidesWhenStopped:YES];
    [_activityIndicator stopAnimating];
    [self addSubview:_activityIndicator];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(activityIndicatorTaped:)];
    [_activityIndicator addGestureRecognizer:tap];
}



-(void)activityIndicatorTaped:(id)sender {
    [self sendActionsForControlEvents:(UIControlEventTouchUpInside)]; 
}

-(void)commonInit {
        
    _loading = NO;
    _hideImageWhenLoading = YES;
    _hideTextWhenLoading  = YES;
    _activityIndicatorAlignment = RNLoadingButtonAlignmentCenter;
    _activityIndicatorEdgeInsets = UIEdgeInsetsZero;
    
    self.adjustsImageWhenHighlighted = NO;
    
    //self.imagens = [NSMutableDictionary new];
    self.texts         = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                          [super titleForState:UIControlStateNormal], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal],
                          [super titleForState:UIControlStateHighlighted], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateHighlighted],
                          [super titleForState:UIControlStateDisabled], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateDisabled],
                          [super titleForState:UIControlStateSelected], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateSelected],
                          nil];
    //titleForState
    
    self.imagens           =  [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               [super imageForState:UIControlStateNormal], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal],
                               [super imageForState:UIControlStateHighlighted], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateHighlighted],
                               [super imageForState:UIControlStateDisabled], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateDisabled],
                               [super imageForState:UIControlStateSelected], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateSelected],
                               nil];
    
    //self.indicatorStyles = [NSMutableDictionary new];
    self.indicatorStyles = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithInt:UIActivityIndicatorViewStyleGray], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal],
                            [NSNumber numberWithInt:UIActivityIndicatorViewStyleGray], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateHighlighted],
                            [NSNumber numberWithInt:UIActivityIndicatorViewStyleGray], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateDisabled],
                            [NSNumber numberWithInt:UIActivityIndicatorViewStyleGray], [NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateSelected],
                            nil];

    
    [self addObserver:self forKeyPath:@"self.state" options:(NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew) context:NULL];
    [self addObserver:self forKeyPath:@"self.selected" options:(NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew) context:NULL];
    [self addObserver:self forKeyPath:@"self.highlighted" options:(NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew) context:NULL];

}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupActivityIndicator];
  
    // Imagens - Icones
    if ([super imageForState:(UIControlStateNormal)])
        [self setValue:[super imageForState:(UIControlStateNormal)]  inDictionary:_imagens forControlState:UIControlStateNormal];
    if ([super imageForState:(UIControlStateHighlighted)])
        [self setValue:[super imageForState:(UIControlStateHighlighted)]  inDictionary:_imagens forControlState:UIControlStateHighlighted];
    if ([super imageForState:(UIControlStateDisabled)])
        [self setValue:[super imageForState:(UIControlStateDisabled)]  inDictionary:_imagens forControlState:UIControlStateDisabled];
    if ([super imageForState:(UIControlStateSelected)])
        [self setValue:[super imageForState:(UIControlStateSelected)]  inDictionary:_imagens forControlState:UIControlStateSelected];
    

    // Títulos - Textos
    if ([super titleForState:(UIControlStateNormal)])
        [self setValue:[super titleForState:(UIControlStateNormal)]  inDictionary:_texts forControlState:UIControlStateNormal];
    if ([super titleForState:(UIControlStateHighlighted)])
        [self setValue:[super titleForState:(UIControlStateHighlighted)]  inDictionary:_texts forControlState:UIControlStateHighlighted];
    if ([super titleForState:(UIControlStateDisabled)])
        [self setValue:[super titleForState:(UIControlStateDisabled)]  inDictionary:_texts forControlState:UIControlStateDisabled];
    if ([super titleForState:(UIControlStateSelected)])
        [self setValue:[super titleForState:(UIControlStateSelected)]  inDictionary:_texts forControlState:UIControlStateSelected];    
}

const CGFloat kImageTopOffset   = -11;
const CGFloat kTextBottomOffset = -15;


-(void)layoutSubviews {
    [super layoutSubviews];
    
    [_activityIndicator setActivityIndicatorViewStyle:[self activityIndicatorStyleForState:[self currentControlState]]];
    
    [_activityIndicator setFrame: [self frameForActivityIndicator]];
    [self bringSubviewToFront:_activityIndicator];

/*
    UIImage *image = [[self imageView] image];
    [self setTitleEdgeInsets: UIEdgeInsetsMake( 0.0, -image.size.width, kTextBottomOffset,  0.0)];
    [self setImageEdgeInsets: UIEdgeInsetsMake( kImageTopOffset, 0.0, 0.0,- self.titleLabel.bounds.size.width)];
 */

}

// Reference
// https://github.com/FTW/FTWButton/blob/master/FTWButton/FTWButton.m


#pragma mark -  setters and getters

-(void)setLoading:(BOOL)loading {
    @synchronized(self){
        _loading = loading;
        [self configureViewForControlState:[self currentControlState]];
    }
}


-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [self setValue:title inDictionary:_texts forControlState:state];
    if ([super titleForState:state] != title)
        [super setTitle:title forState:state];
	[self setNeedsLayout];
}

-(NSString *)titleForState:(UIControlState)state {
    return [self getValueFromDictionary:_texts forControlState:state];
}



-(void)setImage:(UIImage *)image forState:(UIControlState)state {
    /*
	if (state == UIControlStateNormal) {
		self.imageView.image = image;
	}
	if (state & UIControlStateSelected) {
		self.imageView.image = image;
	}
    */
	[self setValue:image inDictionary:_imagens forControlState:state];
    if ([super imageForState:state] != image)
        [super setImage:image forState:state];
	[self setNeedsLayout];
}

-(UIImage *)imageForState:(UIControlState)state {
    return [self getValueFromDictionary:_imagens forControlState:state];
}

-(void)setActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style forState:(UIControlState)__state{
	[self setValue:[NSNumber numberWithInt:style] inDictionary:_indicatorStyles forControlState:__state];
	[self setNeedsLayout];
}

- (UIActivityIndicatorViewStyle)activityIndicatorStyleForState:(UIControlState)__state{
    
    UIActivityIndicatorViewStyle retStyle = UIActivityIndicatorViewStyleGray;
    if ([self getValueFromDictionary:_indicatorStyles forControlState:__state]){
        retStyle = [(NSNumber *)[self getValueFromDictionary:_indicatorStyles forControlState:__state] integerValue];
    }
    return retStyle;
}


- (UIControlState) currentControlState {
	UIControlState controlState = UIControlStateNormal;
	if (self.selected) {
		controlState += UIControlStateSelected;
	}
	if (self.highlighted) {
		controlState += UIControlStateHighlighted;
	}
	if (!self.enabled) {
		controlState += UIControlStateDisabled;
	}
	return controlState;
}


- (void) configureViewForControlState:(UIControlState)controlState {
    
    if (self.loading){
        [_activityIndicator startAnimating];
        
        if (_hideImageWhenLoading) {
            
            UIImage *img = [self imageForState:UIControlStateNormal];
            // float scale = [[UIScreen mainScreen] scale];
            // img.scale
            UIImage *imgTmp = (img) ? [self clearImageWithSize:img.size scale:1] : nil;
            
            [super setImage:imgTmp forState:UIControlStateNormal];
            [super setImage:imgTmp forState:UIControlStateSelected];
            
            [super setImage:imgTmp forState:controlState];
            [[super imageView] setImage:imgTmp];
        }
        
        if (_hideTextWhenLoading){
            [super setTitle:nil forState:controlState];
            [[super titleLabel] setText:nil];
        }
    }
    else{
        [_activityIndicator stopAnimating];
        
        [super setImage: [self imageForState:controlState] forState: controlState];
        [[super imageView] setImage:[self imageForState:controlState]];
        
        [super setTitle:[self titleForState:controlState] forState:controlState];
        [[super titleLabel] setText:[self titleForState:controlState]];
    }
}


-(void)setActivityIndicatorAlignment:(RNLoadingButtonAlignment)_aligment {
    _activityIndicatorAlignment = _aligment;
    [self setNeedsLayout];
}

-(CGRect)frameForActivityIndicator {
    
    CGRect frame = CGRectZero;
    frame.size = _activityIndicator.frame.size;
    frame.origin.y = ((self.frame.size.height - frame.size.height) / 2);
    
    switch (_activityIndicatorAlignment) {
        case RNLoadingButtonAlignmentLeft:
        {
            //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
            frame.origin.x = _activityIndicatorEdgeInsets.left;
//            frame.origin.y = _activityIndicatorEdgeInsets.top;
        }
            break;
        case RNLoadingButtonAlignmentCenter:
        {
            frame.origin.x = ((self.frame.size.width - frame.size.width) / 2);
        }
            break;
        case RNLoadingButtonAlignmentRight:
        {
            
            float lengthOccupied = 0;
            float x = 0;
            UIImageView *imageView = [self imageView];
            UILabel *titleLabel = [self titleLabel];
            
            if (imageView && titleLabel){
                lengthOccupied = imageView.frame.size.width + titleLabel.frame.size.width;
                
                if (imageView.frame.origin.x > titleLabel.frame.origin.x){
                    lengthOccupied+=imageView.frame.origin.x;
                }
                else {
                    lengthOccupied+=titleLabel.frame.origin.x;
                }
            }
            else if (imageView){
                lengthOccupied = imageView.frame.size.width + imageView.frame.origin.x;
            }
            else if (titleLabel){
                lengthOccupied = titleLabel.frame.size.width + imageView.frame.origin.x;
            }
            
            x = (lengthOccupied + _activityIndicatorEdgeInsets.left);
            if ( (x + frame.size.width) > self.frame.size.width){
                x = self.frame.size.width - (frame.size.width + _activityIndicatorEdgeInsets.right);
            }
            else if ( (x + frame.size.width) > (self.frame.size.width - _activityIndicatorEdgeInsets.right)){
                
                 x = self.frame.size.width - (frame.size.width + _activityIndicatorEdgeInsets.right);
            }
            
            //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
            frame.origin.x = x;
            
        }
            break;
            
        default:
            break;
    }
    
    return frame;
}

#pragma mark - default setter and getter

- (void) setValue:(id)value inDictionary:(NSMutableDictionary*)dictionary forControlState:(UIControlState)controlState {
	if (value) {
		[dictionary setValue:value forKey:[NSString stringWithFormat:@"%lu",controlState]];
	} else {
        [dictionary removeObjectForKey:[NSString stringWithFormat:@"%lu",controlState]];
	}
    
	[self configureViewForControlState:[self currentControlState]];
}

- (id) getValueFromDictionary:(NSMutableDictionary*)dictionary forControlState:(UIControlState)controlState {
	if ([dictionary valueForKey:[NSString stringWithFormat:@"%lu",controlState]]) {
		return [dictionary valueForKey:[NSString stringWithFormat:@"%lu",controlState]];
	}
    
    
	if ((controlState & UIControlStateSelected) && [dictionary valueForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateSelected]]) {
		return [dictionary valueForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateSelected]];
	} else if ((controlState & UIControlStateHighlighted) && [dictionary valueForKey:[NSString stringWithFormat:@"%lu", (unsigned long)UIControlStateHighlighted]]) {
		return [dictionary valueForKey:[NSString stringWithFormat:@"%lu", (unsigned long)UIControlStateHighlighted]];
	} else {
		return [dictionary valueForKey:[NSString stringWithFormat:@"%lu",(unsigned long)UIControlStateNormal]];
	}
}



#pragma mark - KVO Observation
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    [self configureViewForControlState:[self currentControlState]];
}

- (UIImage *)clearImageWithSize:(CGSize)_size scale:(float)scale;
{
    UIGraphicsBeginImageContext(_size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, _size.width, _size.height));
//    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.219 alpha:1.000].CGColor);
//    CGContextFillRect(context, CGRectMake(0, 3, 1, 2));
    UIGraphicsPopContext();
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:outputImage.CGImage scale:scale orientation:UIImageOrientationUp];
}

@end
