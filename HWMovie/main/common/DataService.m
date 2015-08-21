//
//  DataService.m
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "DataService.h"

@implementation DataService



+ (id) getJsonDataFromFile:(NSString *)fileName{
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    id jsonDicOrArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return jsonDicOrArray;
    
}

@end
