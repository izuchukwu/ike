
//
//  IKItemActionView.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKItemActionView.h"

@interface IKItemActionView ()

@property (nonatomic) IKTee *tee;

@end

@implementation IKItemActionView

- (id)initWithFrame:(CGRect)frame {
    frame.size = CGSizeMake(375, 117.5);
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"IKItemActionView" owner:self options:nil];
        [self addSubview:_view];
        [self bringSubviewToFront:_view];
    }
    return self;
}

- (IBAction)userDidApplePay:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Purchased"
                              message:@"Thank you for ordering with Iké!"
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
    
    [alertView show];
}

- (IBAction)userDidShare:(id)sender {
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObjects:[_tee teeImage], [_tee name], nil] applicationActivities:nil];
    [_vc presentViewController:activityViewController animated:YES completion:nil];
}

- (void)displayItem:(IKTee *)item {
    _tee = item;
    [_price setText:[NSString stringWithFormat:@"Donate $25 for the %@ today!", [[item charity] causeFight]]];
}

@end
