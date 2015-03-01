//
//  IKTabBarController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 2/28/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKTabBarController.h"

@interface IKTabBarController ()

@end

@implementation IKTabBarController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!_tabBarView) {
        
        [[NSBundle mainBundle] loadNibNamed:@"IKTabBarController" owner:self options:nil];
        
        // Be sure to set the first tab using self.selectedIndex before calling super.
        
        for(UIView *view in self.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]]){
                view.hidden = YES;
                view.alpha = 0.0;
                break;
            }
        }
        
        for (UIView *subview in [_tabBarView subviews]) {
            if([subview isKindOfClass:[UIButton class]]) {
                [(UIButton *)subview addTarget:self action:@selector(tabTouched:) forControlEvents:UIControlEventTouchDown];
            }
        }
        
        currentTab = (int)self.selectedIndex;
        [self updateTabs];
        
        [_tabBarView setFrame:CGRectMake(0, self.view.frame.size.height - 45, self.view.frame.size.width, 45)];
        [self.view addSubview:_tabBarView];
        
        isTabBarVisible = YES;
    }
}

- (void)viewDidLayoutSubviews {
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]]){
            view.hidden = YES;
            view.alpha = 0.0;
            break;
        }
    }
}

#pragma mark - Tab Bar View

- (BOOL)isTabBarHidden {
    return !isTabBarVisible;
}

- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated {
    
    if (hidden == [self isTabBarHidden]) return;
    
    CGRect frame = _tabBarView.frame;
    frame.origin.y += hidden ? frame.size.height : -frame.size.height;
    
    if (animated) {
        [UIView animateWithDuration:0.2f delay:0.0f options:0 animations:^{
            _tabBarView.frame = frame;
            //[tabBarView setAlpha:(hidden ? 0.0 : 1.0)];
        }   completion:nil];
    } else {
        _tabBarView.frame = frame;
    }
    
    isTabBarVisible = !hidden;
}

#pragma mark - Tabs

- (void)tabTouched:(id)sender
{
    UIButton *selectedButton = sender;
    currentTab = (int)selectedButton.tag;
    self.selectedIndex = selectedButton.tag;
    [self updateTabs];
}

- (void)updateTabs
{
    for(UIView *subview in [_tabBarView subviews])
    {
        if([subview isKindOfClass:[UIButton class]]) {
            if (currentTab == subview.tag) {
                [((UIButton *)subview) setSelected:YES];
            } else {
                [((UIButton *)subview) setSelected:NO];
            }
        }
    }
}

@end
