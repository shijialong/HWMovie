//
//  MovieModal.h
//  HWMovie
//
//  Created by huiwen on 15/7/20.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModal : NSObject

@property (nonatomic,copy) NSString *year;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSDictionary *images;
@property (nonatomic,assign) float average;

@end
