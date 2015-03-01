//
//  IKNavigationController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKNavigationController.h"

@interface IKNavigationController ()

@end

@implementation IKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self navigationBar] setTintColor:[UIColor colorWithRed:0.133 green:0.259 blue:0.424 alpha:1.000]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
