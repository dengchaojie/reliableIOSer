//
//  Person.m
//  Equal
//
//  Created by chao jie deng on 2020/4/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Person.h"

@implementation Person


- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (BOOL)isEqual:(id)object {
    
    if (![object isMemberOfClass:Person.class]) {

        return false;
    }
    Person *temp = (Person *)object;
    
    return [self.name isEqualToString:temp.name] && [self.idNumber isEqualToString:temp.idNumber];
    
}



- (NSUInteger)hash {
    return self.name.hash ^ self.idNumber.hash;
}


@end
