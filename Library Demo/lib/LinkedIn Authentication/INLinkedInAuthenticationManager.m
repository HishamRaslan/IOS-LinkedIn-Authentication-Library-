//
//  LinkedInAuthenticationManager.m
//  LinkedIn Authentication Project
//
//  Created by Inova 1 on 9/2/14.
//  Copyright (c) 2014 Inova. All rights reserved.
//

#import "INLinkedInAuthenticationManager.h"
#import "INLinkedInAuthenticationViewController.h"
@interface INLinkedInAuthenticationManager ()
{
    void(^completionhandler)(NSString * ,NSString * , NSString *  , NSString * );
    INLinkedInAuthenticationViewController *call;
}
@end

@implementation INLinkedInAuthenticationManager

-(void)authenticateWithCompletionHandler:(void(^)(NSString *access_token ,NSString *expiration , NSString * error ,NSString * error_description   ))aCompletionHandler
{
    call = [[INLinkedInAuthenticationViewController alloc]init];
    call.delegate = self;
    UIWindow * window= [[UIApplication sharedApplication].windows objectAtIndex:0] ;
    [window addSubview:call.view];
    completionhandler = aCompletionHandler;
}
-(void)replywithAcessToken:(NSString *)accessToken expiration:(NSString *)expires_in error:(NSString *)error errorDescription:(NSString *)error_Description
{
    [call.view removeFromSuperview];
    completionhandler(accessToken,expires_in,error,error_Description);
}

@end
