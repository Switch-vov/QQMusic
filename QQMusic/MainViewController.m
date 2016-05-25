//
//  MainViewController.m
//  QQMusic
//
//  Created by test on 16/5/16.
//  Copyright © 2016年 com.switch.QQMusic. All rights reserved.
//

#import "MainViewController.h"
#import "UIView+Blur.h"

#define kWidth  self.view.bounds.size.width     // self.view的宽度
#define kHeight self.view.bounds.size.height    // self.view的高度

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建视图
    // 1.创建背景视图
    [self _createBackgroundView];
    
    
    // 2.创建顶部导航栏视图
    [self _createNavigationBar];
    
    
    // 3.创建播放工具视图
    [self _createPlayBar];
    
    // 4.创建进度工具视图
    [self _createProgressBar];

}

// 1.创建背景视图
- (void)_createBackgroundView {
    UIImage *img =  [UIImage imageNamed: @"joy.jpg"];
    _bgView = [[UIImageView alloc] initWithImage:img];
    
    // 指定大小
    _bgView.frame = self.view.bounds;
    // _bgView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    // 添加子视图
    [self.view addSubview:_bgView];
}


// 2.创建顶部导航栏视图
- (void)_createNavigationBar {
    // 1.IOS8 UIkit提供毛玻璃效果视图
    UIView *blurView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    // 开启此视图毛玻璃效果
    [blurView enableBlur:YES];
    // 设置颜色
    blurView.blurTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    // 设置毛玻璃的样式：浅色、深色
    blurView.blurStyle = UIViewBlurDarkStyle;
    [self.view addSubview:blurView];
    
    // 2.创建左边按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 20, 60, 64 - 20);
    [leftButton setImage:[UIImage imageNamed:@"top_back_white"] forState:UIControlStateNormal];
    [blurView addSubview:leftButton];
    
    // 3.创建右边收藏按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(kWidth - 60, 20, 60, 64 - 20);
    [rightButton setImage:[UIImage imageNamed:@"playing_btn_in_myfavor_h"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"playing_btn_in_myfavor"] forState:UIControlStateSelected];
    [rightButton addTarget:self action:@selector(loveAction:) forControlEvents:UIControlEventTouchUpInside];
    [blurView addSubview:rightButton];
    
    // 4.歌手、歌名
    UILabel *songLabel = [[UILabel alloc] initWithFrame:CGRectMake((kWidth - 180) / 2, 20, 180, 30)];
    songLabel.backgroundColor = [UIColor clearColor];
    songLabel.text = @"安静";
    songLabel.textColor = [UIColor  whiteColor];
    songLabel.textAlignment = NSTextAlignmentCenter;
    songLabel.font = [UIFont boldSystemFontOfSize:20];
    [blurView addSubview:songLabel];
    
    UILabel *singerLabel = [[UILabel alloc] initWithFrame:CGRectMake((kWidth - 180) / 2, 50, 180, 64 - 20 - 30)];
    singerLabel.backgroundColor = [UIColor clearColor];
    singerLabel.text = @"周杰伦";
    singerLabel.textColor = [UIColor  whiteColor];
    singerLabel.textAlignment = NSTextAlignmentCenter;
    singerLabel.font = [UIFont boldSystemFontOfSize:14];
    [blurView addSubview:singerLabel];
    
}






// 3.创建播放工具视图
- (void)_createPlayBar {
    // 1.IOS8 UIkit提供毛玻璃效果视图
    _playBarView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight - 100, kWidth, 100)];
    // 开启此视图毛玻璃效果
    [_playBarView enableBlur:YES];
    // 设置颜色
    _playBarView.blurTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    // 设置毛玻璃的样式：浅色、深色
    _playBarView.blurStyle = UIViewBlurDarkStyle;
    [self.view addSubview:_playBarView];
    
    // 2.上一首按钮
    UIButton *preButton = [UIButton buttonWithType:UIButtonTypeCustom];
    preButton.tag = 100;
    preButton.frame = CGRectMake(60, (100 - 40) / 2, 40, 40);
    [preButton setImage:[UIImage imageNamed:@"playing_btn_pre_n"] forState:UIControlStateNormal];
    [preButton setImage:[UIImage imageNamed:@"playing_btn_pre_h"] forState:UIControlStateHighlighted];
    [preButton addTarget:self action:@selector(passSong:) forControlEvents:UIControlEventTouchUpInside];
    [_playBarView addSubview:preButton];
    
    // 3.下一首按钮
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.tag = 101;
    nextButton.frame = CGRectMake(kWidth - 60 - 40, (100 - 40) / 2, 40, 40);
    [nextButton setImage:[UIImage imageNamed:@"playing_btn_next_n"] forState:UIControlStateNormal];
    [nextButton setImage:[UIImage imageNamed:@"playing_btn_next_h"] forState:UIControlStateHighlighted];
    [nextButton addTarget:self action:@selector(passSong:) forControlEvents:UIControlEventTouchUpInside];
    [_playBarView addSubview:nextButton];

    
    // 播放按钮
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _playButton.tag = 200;
    _playButton.frame = CGRectMake((kWidth - 60) / 2, (100 - 60) / 2, 60, 60);
    [_playButton setImage:[UIImage imageNamed:@"playing_btn_play_n"] forState:UIControlStateNormal];
    [_playButton setImage:[UIImage imageNamed:@"playing_btn_play_h"] forState:UIControlStateHighlighted];
    [_playButton addTarget:self action:@selector(playSong:) forControlEvents:UIControlEventTouchUpInside];
    [_playBarView addSubview:_playButton];
    
    
    // 暂停按钮
    _pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _pauseButton.tag = 201;
    _pauseButton.hidden = YES;
    _pauseButton.frame = CGRectMake((kWidth - 60) / 2, (100 - 60) / 2, 60, 60);
    [_pauseButton setImage:[UIImage imageNamed:@"playing_btn_pause_n"] forState:UIControlStateNormal];
    [_pauseButton setImage:[UIImage imageNamed:@"playing_btn_pause_h"] forState:UIControlStateHighlighted];
    [_pauseButton addTarget:self action:@selector(playSong:) forControlEvents:UIControlEventTouchUpInside];
    [_playBarView addSubview:_pauseButton];
}

// 4.创建进度工具视图
- (void)_createProgressBar {
    // 1.左边时间的Label
    UILabel *progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 0, 0)];
    progressLabel.text = @"00:00";
    progressLabel.textColor = [UIColor whiteColor];
    progressLabel.backgroundColor = [UIColor clearColor];
    progressLabel.font = [UIFont boldSystemFontOfSize:14];
    [progressLabel sizeToFit];
    [_playBarView addSubview:progressLabel];
    
    // 2.右边时间的Label
    UILabel *durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 0, 0)];
    durationLabel.text = @"05:00";
    durationLabel.textColor = [UIColor whiteColor];
    durationLabel.backgroundColor = [UIColor clearColor];
    durationLabel.font = [UIFont boldSystemFontOfSize:14];
    [durationLabel sizeToFit];
    CGRect frame1 = durationLabel.frame;
    // 重新赋值宽度
    frame1.origin.x = kWidth - frame1.size.width - 10;
    durationLabel.frame = frame1;
    
    [_playBarView addSubview:durationLabel];
    
    durationLabel.frame.size.width;
    durationLabel.frame.size.height;
    durationLabel.frame.origin.x;
    durationLabel.frame.origin.y;
    
    // 3.进度滑块
}

#pragma mark - UIButton Action 点击事件
// 收藏按钮的点击
- (void)loveAction:(UIButton *)button {
    button.selected = !button.selected;
}

// 上一首、下一首的点击
- (void)passSong:(UIButton *)button {
    if(button.tag == 100) {
        // 上一首
        
    } else if(button.tag == 101) {
        // 下一首
    }
}

// 播放，暂停
- (void)playSong:(UIButton *) button {
    if(button.tag == 200) {
        // 播放
        // 播放按钮隐藏
        _playButton.hidden = YES;
        // 暂停按钮显示
        _pauseButton.hidden = NO;
        
    } else if(button.tag == 201) {
        // 暂停
        // 暂停按钮隐藏
        _pauseButton.hidden = YES;
        // 播放按钮显示
        _playButton.hidden = NO;
        
    }
}



@end
