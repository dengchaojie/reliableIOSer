//
//  BaseWebViewController.h
//  HYBmerchant
//
//  Created by hrtpayment on 2018/4/4.
//  Copyright © 2018年 Hrtpayment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol HYBBaseWebViewDelegate <NSObject>

- (void)hyb_webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation;

- (void)hyb_webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation;


@end

@interface BaseWebViewController : UIViewController
<
WKScriptMessageHandler,
WKNavigationDelegate,
WKUIDelegate
>

@property (nonatomic , weak) id<HYBBaseWebViewDelegate> delegate;

/** WebView */
@property (nonatomic , strong) WKWebView *webView;

/** WebView URL */
@property (nonatomic , copy  ) NSString *urlString;


/** 是否一键返回首页 */
@property (nonatomic , assign) BOOL isCanGoBack;


- (void)addRightButtonForXinYongKaHuanKuan;
@end
