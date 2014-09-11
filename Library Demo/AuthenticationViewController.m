//
//  authenticationViewController.m
//  Library Demo
//
//  Created by Inova 1 on 9/2/14.
//  Copyright (c) 2014 Inova. All rights reserved.
//

#import "AuthenticationViewController.h"
#import "INLinkedInAuthenticationManager.h"
@interface AuthenticationViewController ()
{
    INLinkedInAuthenticationManager * test;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *authenticationButton;

@end

@implementation AuthenticationViewController

- (void)viewDidLoad
{

    UIColor *colour = [[UIColor alloc] initWithRed: 0.3294 green:0.3294 blue:0.3294  alpha: 1.0];
    self.view.backgroundColor = colour;

    UIImage *background = [UIImage imageNamed: @"linkedin_logo.png"];
    self.imageView.image=background;
    
    UIImage *buttonImage = [UIImage imageNamed:@"linkedInLogin.png"];
    [self.authenticationButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)authenticateUser:(id)sender {
    
    test = [[INLinkedInAuthenticationManager alloc]init];
    [test authenticateWithCompletionHandler:^(NSString *access_token, NSString *expiration, NSString *error, NSString *error_description) {
        NSLog(@" access Token %@  expiration  %@ error %@ description %@",access_token,expiration,error,error_description);
        if(error)
        {
            NSLog(@"ERROR Description %@",error_description);
        }
        else
        {
            //use the access token 
        }
    }];
}

@end
