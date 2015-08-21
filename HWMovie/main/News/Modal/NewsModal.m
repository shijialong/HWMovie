//
//  NewsModal.m
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsModal.h"

@implementation NewsModal

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.newsId = [value integerValue];
    }
}
@end
