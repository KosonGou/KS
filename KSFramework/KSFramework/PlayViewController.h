//
//  PlayViewController.h
//  UniversalMediaPlay
//
//  Created by 郭祖宏 on 5/6/14.
//  Copyright (c) 2014 Billy zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

/**
 *  定义两个播放源为枚举类型
 */
typedef NS_ENUM(NSInteger, PlaySource){

    PlaySourceFromLocalFile = 0,  // 从本地读取文件进行播放
    PlaySourceFromInternet = 1    // 从网络上获取url进行播放
    
};


@interface PlayViewController : UIViewController

@property (nonatomic,strong)MPMoviePlayerViewController *mpMovie;
@property (nonatomic,strong)AVAudioPlayer *audioPlayer;
@property (nonatomic,strong)AVPlayer *avPlayer;

-(void)playWithUrl:(NSString *)pathUrl orFileName:(NSString *)fileName playSouceFrom:(PlaySource)souce;

@end
