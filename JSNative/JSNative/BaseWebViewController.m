//
//  BaseWebViewController.m
//  HYBmerchant
//
//  Created by hrtpayment on 2018/4/4.
//  Copyright © 2018年 Hrtpayment. All rights reserved.
//

#import "BaseWebViewController.h"
//#import "SDWebImageManager.h"
//#import <JKWKWebViewHandler/JKWKWebViewHandler.h>



@interface BaseWebViewController ()
{
    /*
     网页第一页的标题 (只要当前页标题跟第一页标题相同,在返回时就直接退出控制器, 否则只返回网页的前一页)
     */
    NSString *_firstPageTitle;
    NSString *_currenPagetTitle;
}
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];

    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"return_image"] forState:UIControlStateNormal];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 15);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = item;
    
    NSURL *path = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];

    [self.webView loadRequest:[NSURLRequest requestWithURL:path]];
//    [[WKUserScript alloc] initWithSource:<#(nonnull NSString *)#> injectionTime:<#(WKUserScriptInjectionTime)#> forMainFrameOnly:<#(BOOL)#>]
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"loading"]) {
        NSLog(@"loading");
    } else if ([keyPath isEqualToString:@"title"]) {
        if (!self.navigationItem.title) {
            self.navigationItem.title = self.webView.title;
        }
    } else if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        [_progressView setProgress:[change[@"new"] floatValue] animated:YES];
        
        if (_progressView.progress >= 1.0) {
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.1f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                [weakSelf.progressView setProgress:0 animated:NO];
                weakSelf.progressView.hidden = YES;
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - 返回键事件
-(void)backAction{
    if (_isCanGoBack) {
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        NSString *hostname = _webView.URL.absoluteString;
        if ([hostname containsString:@"95516.com"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        
        BOOL isFirstPage = [_currenPagetTitle isEqualToString:_firstPageTitle];
        if ([_webView canGoBack] && !isFirstPage) {
            [_webView goBack];
        }else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([message.name isEqualToString:@"addRePaymentNoteForIOS"]){
//        [[NSNotificationCenter defaultCenter] postNotificationName:NotePanDuanJingWeiDu object:nil];
    }
    if ([message.name isEqualToString:@"JSObject"]){
    //        [[NSNotificationCenter defaultCenter] postNotificationName:NotePanDuanJingWeiDu object:nil];
        NSLog(@"%@", message.body);
        [self.webView evaluateJavaScript:@"picCallback('dengchaojie')" completionHandler:^(id _Nullable script, NSError * _Nullable error) {
//               NSLog(@"--error----%@",error);
        }];
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error == nil) {
//        [HYBLoadingTool showSuccessWithStatus:@"保存成功"];
    }else{
//        [HYBLoadingTool showErrorWithStatus:@"保存失败"];
    }
}

#pragma mark - WKNavigationDelegate
// 决定导航的动作，通常用于处理跨域的链接能否导航。WebKit对跨域进行了安全检查限制，不允许跨域，因此我们要对不能跨域的链接
// 单独处理。但是，对于Safari是允许跨域的，不用这么处理。
// 这个是决定是否Request
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    NSString *hostname = navigationAction.request.URL.host.lowercaseString;
//    NSLog(@"hostname == %@", hostname);
//    if (navigationAction.navigationType == WKNavigationTypeLinkActivated
//        && ![hostname containsString:@".baidu.com"]) {
//        // 对于跨域，需要手动跳转
//        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
//
//        // 不允许web内跳转
//        decisionHandler(WKNavigationActionPolicyCancel);
//    } else {
//    decisionHandler(WKNavigationActionPolicyAllow);
//    }
    
//    if ([navigationAction.request.URL.absoluteString isEqualToString:@"http://store.yunqixinxi.com/login"]) {
//
//        [_webView loadRequest:[NSURLRequest requestWithURL:navigationAction.request.URL]];
//        decisionHandler(WKNavigationActionPolicyCancel);
//        return;
//    }
    
    self.progressView.hidden = NO;
//    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
//    [self.view bringSubviewToFront:self.progressView];
    NSString *requestString = [[[navigationAction.request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSArray *components = [requestString componentsSeparatedByString:@"|"];
    NSString *str1 = [components objectAtIndex:0];
    NSArray *array2 = [str1 componentsSeparatedByString:@"/"];
    NSInteger coun = array2.count;
    if (coun > 3) {
        //        NSString *yuMing = array2[2];
        //        if (yuMing.length >= 12) {
        //            NSString *hybSub = [yuMing substringFromIndex:yuMing.length - 12];
        //            NSString *subSting = [yuMing substringFromIndex:yuMing.length - 9];
        //            if (![subSting isEqualToString:@"95516.com"] || ![hybSub isEqualToString:@"hybunion.cn"]) {
        //                return NO;
        //            }
        //        }
        NSString *method = array2[coun-1];
        if ([method containsString:@"retuenMainApp"] || [method containsString:@"phoneWechatPublicAcc_retuenMainApp"])//查看详情，其中红色部分是HTML5跟咱们约定好的，相应H5上的按钮的点击事件后，H5发送超链接，客户端一旦收到这个超链接信号。把其中的点击按钮的约定的信号标示符截取出来跟本地的标示符来进行匹配，如果匹配成功，那么就执行相应的操作，详情见如下所示。
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

// 决定是否接收响应
// 这个是决定是否接收response
// 要获取response，通过WKNavigationResponse对象获取
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 当main frame的导航开始请求时，会调用此方法
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
//    NSLog(@"导航开始请求");
}

// 当main frame接收到服务重定向时，会回调此方法
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {

    NSLog(@"调用了重定向");
}

// 当main frame开始加载数据失败时，会回调
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
//    [HYBLoadingTool showErrorWithStatus:@"网络无法连接"];
    [self.progressView setProgress:0 animated:NO];
    self.progressView.hidden = YES;
}

// 当main frame的web内容开始到达时，会回调
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
//    NSLog(@"内容到达");
    
    if([_delegate respondsToSelector:@selector(hyb_webView:didCommitNavigation:)]){
        [_delegate hyb_webView:webView didCommitNavigation:navigation];
    }
}

// 当main frame导航完成时，会回调
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    if (!_firstPageTitle) {
        _firstPageTitle = webView.title;
    }
    _currenPagetTitle = webView.title;
    self.navigationItem.title = webView.title;
    if([_delegate respondsToSelector:@selector(hyb_webView:didFinishNavigation:)]){
        [_delegate hyb_webView:webView didFinishNavigation:navigation];
    }
}

// 当main frame最后下载数据失败时，会回调
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
    NSLog(@"下载数据失败");
}

// 这与用于授权验证的API，与AFN、UIWebView的授权验证API是一样的
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *__nullable credential))completionHandler {
    BOOL judge = [challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust] && [challenge previousFailureCount] == 0;
    if (judge) {
        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        return;
    }
    completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
}

// 当web content处理完成时，会回调
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    
//    NSLog(@"内存过大");
}

#pragma mark - WKUIDelegate
// 可以指定配置对象、导航动作对象、window特性
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    return self.webView;
}

// webview关闭时回调
- (void)webViewDidClose:(WKWebView *)webView{
    
}

// 响应（执行）JS的alert()方法
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:(UIAlertControllerStyleAlert)];
    [vc addAction:[UIAlertAction actionWithTitle:@"好的" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();

    }]];
    [self presentViewController:vc animated:true completion:nil];
    
}

// 响应（执行）JS的confirm()方法
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

// 响应（执行）JS的prompt()方法
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
        textField.textColor = UIColor.blackColor;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)clearWebCache {
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        
        NSSet *websiteDataTypes
        
        = [NSSet setWithArray:@[
                                WKWebsiteDataTypeDiskCache,
                                //WKWebsiteDataTypeOfflineWebApplicationCache,
                                WKWebsiteDataTypeMemoryCache,
                                WKWebsiteDataTypeLocalStorage,
                                WKWebsiteDataTypeCookies,
                                //WKWebsiteDataTypeSessionStorage,
                                //WKWebsiteDataTypeIndexedDBDatabases,
                                //WKWebsiteDataTypeWebSQLDatabases
                                ]];
        
        //NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
        
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
            NSLog(@"\n====== ClearDone - ios9&later ======\n");
        }];
    } else {
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        NSError *errors;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
        NSLog(@"\n====== ClearDone - ios8 ======\n");
    }
}


- (void)addRightButtonForXinYongKaHuanKuan
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"unionPayRightImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStylePlain) target:self action:@selector(touchRightButton)];
}

- (void)touchRightButton
{
//    NSString *mid = self.userhelper.mid;
#ifdef yiMiZhiFu
#else
//    NSString *urlString = [NSString stringWithFormat:@"%@/apph5/mannagelist.html?mid=%@&source=hrt",HeXiaoDaiBaseUrlH5, mid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
#endif
}

#pragma mark - 加载
- (WKWebView *)webView{
    if (!_webView ){
        
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        
        // 设置偏好设置
        configuration.preferences = [[WKPreferences alloc] init];
        configuration.preferences.minimumFontSize = 10; // 默认为0
        configuration.preferences.javaScriptEnabled = YES; // 默认认为YES
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = false; // 在iOS上默认为NO，表示不能自动通过窗口打开
        
        // web内容处理池
        configuration.processPool = [[WKProcessPool alloc] init];
        
        // 通过JS与webview内容交互
        configuration.userContentController = [[WKUserContentController alloc] init];
        [configuration.userContentController addScriptMessageHandler:self name:@"addRePaymentNoteForIOS"];
        [configuration.userContentController addScriptMessageHandler:self name:@"JSObject"];
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 34) configuration:configuration];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
//        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
        
        // 添加KVO监听
        [_webView addObserver:self
                   forKeyPath:@"loading"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
        [_webView addObserver:self
                   forKeyPath:@"title"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
        [_webView addObserver:self
                   forKeyPath:@"estimatedProgress"
                      options:NSKeyValueObservingOptionNew
                      context:nil];

    }
    return _webView;
}

- (UIProgressView *)progressView{
    if (!_progressView){
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 2)];
        //设置轨道颜色
//        _progressView.trackTintColor = [UIColor colorWithHexString:@"F2F2F2"];
        //设置进度颜色
//        _progressView.progressTintColor = [UIColor blackColor];
        
        _progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    }
    return _progressView;
}

- (void)dealloc{
    [_webView removeObserver:self forKeyPath:@"loading"];
    [_webView removeObserver:self forKeyPath:@"title"];
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
