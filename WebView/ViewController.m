//
//  ViewController.m
//  WebView
//
//  Created by 이 해용 on 2014. 1. 9..
//  Copyright (c) 2014년 iamdreamer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate, UIWebViewDelegate>



@end

@implementation ViewController

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    if(UIWebViewNavigationTypeLinkClicked == navigationType){
        
        NSLog(@"클릭금지");
        
        return NO;
        
    }
    return YES;
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    NSString *msg = [error localizedDescription];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"에러" message:msg delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil];
    
    [alert show];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self go:nil];
    
    return YES;
    
}

-(IBAction)go:(id)sender{
    
    if ([_textField.text length] > 3) {
        NSURL *url = [NSURL URLWithString:_textField.text];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadReques:request];
        
        [_textField resignFirstResponder];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
