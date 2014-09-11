//
//  authenticationViewController.h
//  LinkedIn Authentication Project
//
//  Created by Inova 1 on 9/1/14.
//  Copyright (c) 2014 Inova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INLinkedInResponseDelegate.h"
@interface INLinkedInAuthenticationViewController : UIViewController <UIWebViewDelegate>
@property   id <INLinkedInResponseDelegate> delegate;

@end
