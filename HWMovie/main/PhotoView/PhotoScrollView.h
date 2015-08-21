//
//  PhotoScrollView.h
//  HWMovie
//
//  Created by huiwen on 15/7/23.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;
}
@property (nonatomic,retain) NSString *imageUrlStr;
@end
