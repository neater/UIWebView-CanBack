//
//  UIWebView+WithBack.m
//  BackWebView
//
//  Created by Wenxiao Zhang on 13/11/26.
//

#import "UIWebView+CanBack.h"

@implementation UIWebView (CanBack)

UIToolbar *toolBar;

- (void)loadRequest:(NSURLRequest *)request inView:(UIView *)parentView
{
    self.delegate = self;
    [self loadRequest:request];
    
    [self makeBackBarInView:parentView];
    [self makeBackButton];
}

- (void)makeBackBarInView:(UIView *)parentView
{
    float toolBarWidth = CGRectGetWidth(parentView.frame);
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, toolBarWidth, 50)];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    toolBar.hidden = YES;
    [parentView addSubview:toolBar];
}

- (void)makeBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 50)];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [toolBar addSubview:backButton];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BackClicked:)];
    [backButton addGestureRecognizer:singleTap];
}

#pragma mark - UIWebview delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (self.canGoBack) {
        toolBar.hidden = NO;
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (self .canGoBack) {
        toolBar.hidden = NO;
    }
    else {
        toolBar.hidden = YES;
    }
    
    return YES;
}

-(void) BackClicked:(id)sender
{
    if (self.canGoBack) {
        [self goBack];
    }
}

#pragma mark - LifeCycle

- (void)dealloc
{
    self.delegate = nil;
}

@end