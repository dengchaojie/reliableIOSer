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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arr = NSMutableArray.new;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIImagePickerController *vc = UIImagePickerController.new;
    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
    vc.delegate = self;
    [self presentViewController:vc animated:true completion:nil];
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
