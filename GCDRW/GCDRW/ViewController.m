//
//  ViewController.m
//  GCDRW
//
//  Created by chao jie deng on 2020/4/9.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "WHObject.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WHObject *obj = WHObject.new;
    
    self.view.backgroundColor = UIColor.blueColor;
//    self.view.layer.backgroundColor
    
    
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (int i = 0; i < 10; i++) {
                NSString *res = [obj valueForKey:@"name"];
                NSLog(@"%d--%@",i, res);
            }
        });
        
   
    
    
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (int i = 10; i < 13; i++) {
                NSString *str = [NSString stringWithFormat:@"dcj--%d", i];
                NSLog(@"%d--",i);
                [obj setValue:str forKey:@"name"];
            }
        });
        
    
    
    
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (int i = 20; i < 22; i++) {
                NSString *str = [NSString stringWithFormat:@"zxx--%d", i];
                NSLog(@"%d--",i);
                [obj setValue:str forKey:@"name"];
            }
        });
        
    
    
    
}



@end
