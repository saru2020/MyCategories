//
//  UIView+View.m
//  Categories
//
//  Created by Saravanan on 1/6/14.
//  Copyright (c) 2014 Saravanan. All rights reserved.
//


#import "UIView+View.h"

@implementation UIView (View)
-(void)addParallaxEffect{
    UIInterpolatingMotionEffect *interpolationHorizontal = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    interpolationHorizontal.minimumRelativeValue = @-10.0;
    interpolationHorizontal.maximumRelativeValue = @10.0;
    
    UIInterpolatingMotionEffect *interpolationVertical = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    interpolationVertical.minimumRelativeValue = @-10.0;
    interpolationVertical.maximumRelativeValue = @10.0;
    
    [self addMotionEffect:interpolationHorizontal];
    [self addMotionEffect:interpolationVertical];
}
@end
