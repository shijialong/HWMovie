//
//  DataService.h
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject

+ (id) getJsonDataFromFile:(NSString *)fileName;

@end
