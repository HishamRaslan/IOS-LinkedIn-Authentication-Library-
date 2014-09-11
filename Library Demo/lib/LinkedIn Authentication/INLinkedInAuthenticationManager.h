//
//  LinkedInAuthenticationManager.h
//  LinkedIn Authentication Project
//
//  Created by Inova 1 on 9/2/14.
//  Copyright (c) 2014 Inova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "INLinkedInResponseDelegate.h"
@interface INLinkedInAuthenticationManager : NSObject <INLinkedInResponseDelegate>

-(void)authenticateWithCompletionHandler:(void(^)(NSString *access_token ,NSString *expiration , NSString * error ,NSString * error_description   ))aCompletionHandler;

@end
