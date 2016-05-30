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
// 导航视图
@property(nonatomic, copy) UIView *blurView;
// 滑块
@property(nonatomic, copy) UISlider *slider;
// 音乐数据
@property(nonatomic) NSArray *data;
// 当前歌曲
@property(nonatomic) NSInteger index;

@end
