//
//  TWThread.h
//  CFRunloopTest
//
//  Created by HaKim on 16/1/26.
//  Copyright © 2016年 haKim. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TaskBlock) (void);

@interface TWThread : NSObject

- (void)start;
- (void)stop;

- (void)runWithTask:(TaskBlock)task;

@end
