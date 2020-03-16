//
//  Person.m
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/14.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic, strong) dispatch_queue_t conc;

@end

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _conc = dispatch_queue_create("conc", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (id)readDataForKey:(NSString *)key {
    __block id result;
    dispatch_sync(self.conc, ^{
        NSLog(@"currentThread == %@", [NSThread currentThread]);
        result = [self valueForKey:key];
    });
    
    return result;
}

- (void)setData:(id)data forKey:(NSString *)key {
    dispatch_barrier_sync(self.conc, ^{
        [self setValue:data forKey:key];
    });

}

@end
