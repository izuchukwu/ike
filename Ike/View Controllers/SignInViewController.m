//
//  SignInViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 2/28/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "SignInViewController.h"

#import <Accounts/Accounts.h>

@interface SignInViewController ()

@property (nonatomic) NSArray *accounts;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInWithTwitter:(id)sender {
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        if (granted == YES)
        {
            // Get account and communicate with Twitter API
            
            NSLog(@"Access granted to Twitter accounts");
            _accounts = [accountStore accountsWithAccountType:accountType];
            //NSLog(@"Twitter Accounts found: %@", _accounts);
            
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select an Account to Sign In" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles: nil];
            
            for (ACAccount *account in _accounts) {
                [actionSheet addButtonWithTitle:[account username]];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [actionSheet showInView:[self view]];
            });
        }
    }];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (!buttonIndex) {
        // cancelled
    } else if (buttonIndex <= [_accounts count]) {
        ACAccount *account = [_accounts objectAtIndex:(buttonIndex - 1)];
        NSLog(@"Signing In with %@", [account username]);
        [[NSUserDefaults standardUserDefaults] setObject:[account identifier] forKey:@"account-identifier"];
        [self dismissModalViewControllerAnimated:YES];
    }
}

@end
