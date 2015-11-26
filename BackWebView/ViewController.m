//
//  ViewController.m
//  BackWebView
//
//  Created by Happy Hacking on 15/11/25.
//  Copyright (c) 2015年 CheilOpenTide. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+CanBack.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request inView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
