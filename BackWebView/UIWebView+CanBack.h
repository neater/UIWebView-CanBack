//
//  UIWebView+WithBack.h
//  BackWebView
//
//  Created by Happy Hacking on 15/11/26.
//  Copyright (c) 2015年 CheilOpenTide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (CanBack) <UIWebViewDelegate>

- (void)loadRequest:(NSURLRequest *)request inView:(UIView *)parentView;

@end
