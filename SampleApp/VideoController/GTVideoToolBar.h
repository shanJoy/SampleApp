//
//  GTVideoToolBar.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/17.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTScreen.h"

//NS_ASSUME_NONNULL_BEGIN

#define GTVideoToolBarHeight UI(60)

@interface GTVideoToolBar : UIView

- (void)layoutWithModel:(id)model;

@end

//NS_ASSUME_NONNULL_END
