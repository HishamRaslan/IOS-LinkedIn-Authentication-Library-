//
//  authenticationViewController.m
//  LinkedIn Authentication Project
//
//  Created by Inova 1 on 9/1/14.
//  Copyright (c) 2014 Inova. All rights reserved.
//

#import "INLinkedInAuthenticationViewController.h"
#import "INLinkedInConfig.h"
@interface INLinkedInAuthenticationViewController ()
@property BOOL * submitButton;
@end

@implementation INLinkedInAuthenticationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *buttonz = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonz.frame = CGRectMake(10,10, 30, 30);
    [buttonz addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonz setEnabled:YES];
    
    UIImage *buttonImage = [UIImage imageNamed:@"1409707126_circle_close_delete-128.png"];
    [buttonz setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    UIWebView *view = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 1000)];
    view.delegate =self ;
    NSString *url = [NSString stringWithFormat:@"https://www.linkedin.com/uas/oauth2/authorization?response_type=%@&client_id=%@&scope=%@&state=%@&redirect_uri=%@",response_type,client_id,scope,state,redirect_uri];
    
    
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [view loadRequest:nsrequest];
    [self.view addSubview:view];
    [self.view addSubview:buttonz];
}

-(void)myAction:(id)sender {
    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
   // NSLog(@"Loading URL :%@",request.URL.absoluteString);
    NSString *url =request.URL.absoluteString;
    if ( [url rangeOfString:redirect_uri].location != NSNotFound   &&  [url rangeOfString:@"code"].location  != NSNotFound  && [url rangeOfString:@"state"].location  != NSNotFound  &&[url rangeOfString:@"scope"].location  == NSNotFound ) {
         int  loc1 =[url rangeOfString:@"code"].location;
        int len1 =[url rangeOfString:@"code"].length;
        int  loc2 =[url rangeOfString:@"&"].location;
        int start = loc1+len1+1;
        int end = loc2-start;
        NSString * authorizationCode = [url substringWithRange: NSMakeRange (start, end)];
        NSLog(@"%@",authorizationCode);
        
        NSString *url = [NSString stringWithFormat:@"https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=%@&redirect_uri=%@&client_id=%@&client_secret=%@",authorizationCode,redirect_uri,client_id,client_secret];
        
        
        NSLog(@"url is %@",url);
     //   url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            if(connectionError)
            {
                [self.delegate replywithAcessToken:nil expiration:nil error:connectionError.description errorDescription:connectionError.debugDescription];
            }
            
            NSLog(@"ERROR %@", connectionError);
            NSString *res1 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"Response :%@", res1);
            
            NSError *myError = nil;
            NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&myError];
            if(myError)
            {
                [self.delegate replywithAcessToken:nil expiration:nil error:myError.description errorDescription:myError.description];
            }
           else
            {
                NSString *accessToken = [res valueForKey:@"access_token"];
                NSString *expires_in = [res valueForKey:@"expires_in"];
                NSLog(@"accessToken %@   expires  %@",accessToken , expires_in);
                [self.delegate replywithAcessToken:accessToken expiration:expires_in error:nil errorDescription:nil];
            }
                     }];
    
        return NO;
         }
    
    if ( [url rangeOfString:redirect_uri].location != NSNotFound   &&  [url rangeOfString:@"error"].location  != NSNotFound  && [url rangeOfString:@"error_description"].location  != NSNotFound )
    {
        
        int  loc1 =[url rangeOfString:@"error"].location;
        int len1 =[url rangeOfString:@"error"].length;
        int  loc2 =[url rangeOfString:@"error_description"].location;
        int start = loc1+len1+1;
        int end = loc2-start-1;
        NSString * error = [url substringWithRange: NSMakeRange (start, end)];
        NSLog(@"%@",error);
        
        int  loc3=[url rangeOfString:@"error_description"].location;
        int len3 =[url rangeOfString:@"error_description"].length;
        int  loc4 =[url rangeOfString:@"state"].location;
        int start2 = loc3+len3+1;
        int end2 = loc4-start2-1;
        NSString * error_description = [url substringWithRange: NSMakeRange (start2, end2)];
        NSLog(@"%@",error_description);
        [self.delegate replywithAcessToken:nil expiration:nil error:error errorDescription:error];
        
        return NO;
    }
          return YES;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.delegate replywithAcessToken:nil expiration:nil error:error.description errorDescription:error.debugDescription];

    NSLog(@"Failed to load with error :%@",[error debugDescription]);
    
}
@end
