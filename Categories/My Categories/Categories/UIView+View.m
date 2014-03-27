//
//  UIView+View.m
//  Categories
//
//  Created by Saravanan on 1/6/14.
//  Copyright (c) 2014 Saravanan. All rights reserved.
//


#import "UIView+View.h"
#define kMovingSpeed 250 //pixel per second

@implementation UIView (View)
-(void)addParallaxEffect:(CGFloat)value{
    UIInterpolatingMotionEffect *interpolationHorizontal = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    interpolationHorizontal.minimumRelativeValue = [NSNumber numberWithFloat:-value];
    interpolationHorizontal.maximumRelativeValue = [NSNumber numberWithFloat:value];
    
    UIInterpolatingMotionEffect *interpolationVertical = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    interpolationVertical.minimumRelativeValue = [NSNumber numberWithFloat:-value];
    interpolationVertical.maximumRelativeValue = [NSNumber numberWithFloat:value];
    
    [self addMotionEffect:interpolationHorizontal];
    [self addMotionEffect:interpolationVertical];
}

-(void)shakeView:(CGFloat)value
{
    CGFloat t = value;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    self.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        self.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

///*
//Floating View

-(void)floatLeft:(float)angle value:(float)value{
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.center = CGPointMake(self.center.x - value,
                                                   self.center.y - value);
                         self.transform = CGAffineTransformMakeRotation(-angle);
                         [self floatAnother:angle value:value];
                     }
                     completion:NULL];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.center = CGPointMake(self.center.x + value,
                                                   self.center.y - value);
                         self.transform = CGAffineTransformMakeRotation(angle);
                     }
                     completion:NULL];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.center = CGPointMake(self.center.x - value,
                                                   self.center.y + value);
                         self.transform = CGAffineTransformMakeRotation(angle);
                     }
                     completion:NULL];
    
//    [UIView animateWithDuration:2.0
//                          delay:0.0
//                        options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
//                     animations:^{
//                         self.center = CGPointMake(self.center.x + value,
//                                                   self.center.y + value);
//                         self.transform = CGAffineTransformMakeRotation(angle);
//                     }
//                     completion:NULL];
    
}

-(void)floatAnother:(float)angle value:(float)value{
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.center = CGPointMake(self.center.x + value,
                                                   self.center.y + value);
                         self.transform = CGAffineTransformMakeRotation(angle);
                     }
                     completion:NULL];
}

-(void)floatRight:(UIView*)view{
}

//*/

///*
//Move UIView Randomly across the screen
- (CGFloat) distanceBetweenTwoPoints: (CGPoint) point1 : (CGPoint) point2 {
    CGFloat dx = point2.x - point1.x;
    CGFloat dy = point2.y - point1.y;
    return sqrt(dx*dx + dy*dy );
}

-(void) move{
    UIView *view = self;
    CGPoint viewCenter = view.center;
    CGFloat x = 0;
    if (viewCenter.x == 320) {
        x = 0;
    }
    else
        x = 320;
    
    CGPoint nextCenter = CGPointMake(x, arc4random() % (([self.superview bounds].size.height > 480)?568:460));//or chech for orientation as well
    NSLog(@"nextCenter : %@",NSStringFromCGPoint(nextCenter));
    if (CGPointEqualToPoint(viewCenter, nextCenter))
        [self move];
    
    float distance = [self distanceBetweenTwoPoints:viewCenter :nextCenter];
    double time = distance / kMovingSpeed;
    
    [UIView animateWithDuration:time
                     animations:^{
                         [view setCenter:nextCenter];
                     }
                     completion:^(BOOL finished) {
                         [self move];
                     }];
}

//*/

@end
