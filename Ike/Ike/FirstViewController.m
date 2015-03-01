//
//  FirstViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 2/28/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "FirstViewController.h"
#import "SignInViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    SignInViewController *signIn = [[SignInViewController alloc] init];
    [self presentViewController:signIn animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
