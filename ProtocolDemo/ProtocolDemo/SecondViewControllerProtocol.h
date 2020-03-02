//
//  SecondViewControllerProtocol.h
//  ProtocolDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#ifndef SecondViewControllerProtocol_h
#define SecondViewControllerProtocol_h


@protocol SecondVCProtocol <NSObject>

- (void)sendMsgToViewController:(NSString *_Nullable)msg;

@property (nonatomic, copy) NSString * _Nullable msg;

@end


#endif /* SecondViewControllerProtocol_h */
