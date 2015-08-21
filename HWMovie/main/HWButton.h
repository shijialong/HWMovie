//
//  HWButton.h
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWButton : UIControl
{
    UIImageView *_imageView;
    UILabel *_label;
}

- (id)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;
    


@end
