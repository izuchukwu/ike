//
//  IKTabBarController.h
//  Ike
//
//  Created by Izuchukwu Elechi on 2/28/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKTabBarController : UITabBarController {
    enum {
        IKTabExplore = 0,
        IKTabCharities = 1,
        IKTabCreate = 2,
        IKTabLiked = 3,
        IKTabMe = 4
    };
        
    int currentTab;
    
    BOOL isTabBarVisible;
}

- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated;

@property (strong, nonatomic) IBOutlet UIView *tabBarView;
@property (strong, nonatomic) NSArray *tabBarBackgroundArray;

@end
