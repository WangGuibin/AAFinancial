//
//  ViewController.m
//  AAFinancial
//
//  Created by CoderWGB on 2019/3/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addUserScript:wkUScript];
    
    WKWebViewConfiguration *configue = [[WKWebViewConfiguration alloc] init];
    configue.allowsInlineMediaPlayback = YES;
    configue.userContentController = wkUController;

    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , KHIGHT-kNavBarHeight) configuration: configue];
    adjustsScrollViewInsets_NO(webView.scrollView, self);
    webView.height -= kBottomHeight;
    [self.view addSubview: webView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
    if (self.isPrivacy) {
        self.navigationItem.title = @"普金投资投资协议";
        path = [[NSBundle mainBundle] pathForResource:@"zyPrivacy" ofType:@"html"];
    }
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest: req];
}

- (void)setIsPrivacy:(BOOL)isPrivacy{
    _isPrivacy = isPrivacy;
}

@end
