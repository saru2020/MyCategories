//
//  SARViewController.m
//  Categories
//
//  Created by Saravanan on 1/6/14.
//  Copyright (c) 2014 Saravanan. All rights reserved.
//

#import "SARViewController.h"
#import "UIView+View.h"

@interface SARViewController (){
    UIView *shakeView;
}

@end

@implementation SARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 

    [self.view addParallaxEffect:10];//Adjust this value based on your need
    
    shakeView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, self.view.frame.size.width-200, self.view.frame.size.height-500)];
    shakeView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:shakeView];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(performShakeOperation) userInfo:nil repeats:YES];
}

-(void)performShakeOperation{
    [shakeView shakeView:20];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
