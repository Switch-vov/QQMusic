//
//  MainViewController.h
//  QQMusic
//
//  Created by test on 16/5/16.
//  Copyright © 2016年 com.switch.QQMusic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

// 背景图片
@property(nonatomic, copy) UIImageView *bgView;
// 播放按钮
@property(nonatomic, copy) UIButton *playButton;
// 暂停按钮
@property(nonatomic, copy) UIButton *pauseButton;
// 播放工具视图
@property(nonatomic, copy) UIView *playBarView;


@end
