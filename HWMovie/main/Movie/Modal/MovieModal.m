//
//  MovieModal.m
//  HWMovie
//
//  Created by huiwen on 15/7/20.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MovieModal.h"

@implementation MovieModal

- (NSString *)description {
    NSString *str = [NSString stringWithFormat:@"year=%@,title=%@",_year,_title];
    return str;
}
@end
