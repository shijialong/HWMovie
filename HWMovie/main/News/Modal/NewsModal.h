//
//  NewsModal.h
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModal : NSObject


@property (nonatomic,assign) NSInteger newsId;

@property (nonatomic,copy) NSString *summary;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,assign) NSInteger type;

@end
