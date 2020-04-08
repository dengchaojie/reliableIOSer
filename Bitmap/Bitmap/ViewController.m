//
//  ViewController.m
//  Bitmap
//
//  Created by chao jie deng on 2020/4/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) NSMutableArray *arr;

@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arr = NSMutableArray.new;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
    btn.backgroundColor = UIColor.blueColor;
    [self.view addSubview:btn];
self.btn = btn;
//    Changes to this property can be animated. The default value is nil, which results in a transparent background color.
    ///------
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"%@", [NSThread currentThread]);
//
//        [self performSelector:@selector(asyncAction) withObject:nil afterDelay:3.0];
//        [[NSRunLoop currentRunLoop] run];
//        NSLog(@"%@", [NSRunLoop currentRunLoop]);
//
////        NSLog(@"%@", [NSThread currentThread]);
//
//    });
///------
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//
//        [self performSelector:@selector(threadAction) onThread:[NSThread currentThread] withObject:nil waitUntilDone:true];
//
//    });
//    NSThread *thre = [[NSThread alloc] init];
//    [thre start];
//    NSLog(@"%@",thre);
//    [self performSelector:@selector(threadAction) onThread:thre withObject:nil waitUntilDone:true];
    
    ///---
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"lslsls");
//        NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerAction) userInfo:nil repeats:false];
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//        [[NSRunLoop currentRunLoop] run];
//        NSLog(@"%@", [NSRunLoop currentRunLoop]);
//    });
    int some3 = 10;
    static int som2 = 19;
    __block int someValue = 12;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"some3--- %d",some3);
        NSLog(@"som2--- %d",som2);

        NSLog(@"2--- %d",someValue);

        someValue = 15;
        NSLog(@"3--- %d",someValue);
    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"2--- %d",someValue);
//
//        someValue = 15;
//        NSLog(@"3--- %d",someValue);
//
//    });
    someValue= 20;
    NSLog(@"1--- %d",someValue);
    some3 = 111;
    som2 = 222;
}

- (void)timerAction
{
    NSLog(@"timerAction");

}

- (void)threadAction
{
    NSLog(@"%@",[NSThread currentThread]);
}


- (void)asyncAction
{
//    NSLog(@"");
    NSLog(@"asyncAction");
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
// Main Thread Checker.  a common mistake that can result in missed UI updates, visual defects, data corruptions, and crashes.
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        self.btn.backgroundColor = UIColor.orangeColor;
        self.btn.frame = CGRectMake(200, 200, 200, 200);
    });
//    CAKeyframeAnimation
//    CABasicAnimation
//    UIImagePickerController *vc = UIImagePickerController.new;
//    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
//    vc.delegate = self;
//    [self presentViewController:vc animated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    UIImage *ori = info[UIImagePickerControllerOriginalImage];
//    NSUInteger cos = SDMemoryCacheCostForImage(ori);
    NSData *data = UIImagePNGRepresentation(ori);
    [self.arr addObject:data];//内存暴涨
    NSData *suoXiao = UIImageJPEGRepresentation(ori, 0.1);
    NSLog(@"%@--%@", data, suoXiao);
//    20 271 625
//       363 096
//    NSData *data = UIImageJPEGRepresentation(ori, 0.1);
//    UIImage *new = [UIImage imageWithData:data];
//    NSUInteger cosNew = SDMemoryCacheCostForImage(new);
//    NSLog(@"%lu--%lu", cos, cosNew);
    [picker dismissViewControllerAnimated:true completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:true completion:nil];
}

FOUNDATION_STATIC_INLINE NSUInteger SDMemoryCacheCostForImage(UIImage *image) {
    CGImageRef imageRef = image.CGImage;
    if (!imageRef) {
        return 0;
    }
    NSUInteger bytesPerFrame = CGImageGetBytesPerRow(imageRef) * CGImageGetHeight(imageRef);
    NSUInteger frameCount = 1;
#if SD_MAC
    frameCount = 1;
#elif SD_UIKIT || SD_WATCH
    frameCount = image.images.count > 0 ? image.images.count : 1;
#endif
    NSUInteger cost = bytesPerFrame * frameCount;
    return cost;
}

@end
