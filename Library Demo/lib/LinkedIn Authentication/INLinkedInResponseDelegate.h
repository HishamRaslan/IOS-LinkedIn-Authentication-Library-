//
//  ResponseDelegate.h
//  LinkedIn Authentication Project
//
//  Created by Inova 1 on 9/2/14.
//  Copyright (c) 2014 Inova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol INLinkedInResponseDelegate <NSObject>
-(void)replywithAcessToken:(NSString* )accessToken expiration:(NSString *)expires_in error:(NSString*)error errorDescription : (NSString * )error_Description ;
@end
