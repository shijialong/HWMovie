//
//  TopModal.m
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "TopModal.h"

@implementation TopModal

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    if ([key isEqualToString:@"id"]) {
//        self.newsId = [value integerValue];
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"rating"]) {
        NSDictionary *dic = value;
        _average = [[dic objectForKey:@"average"] floatValue];
    }
}

@end
