//
//  PlayViewController.m
//  UniversalMediaPlay

//  Created by 郭祖宏 on 5/6/14.
//  Copyright (c) 2014 Billy zhou. All rights reserved.

#import "PlayViewController.h"
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#define  mScreenWidth  [[UIScreen mainScreen]bounds].size.width
#define  mScreenHeight [[UIScreen mainScreen]bounds].size.height


@interface PlayViewController ()

@end

@implementation PlayViewController
@synthesize mpMovie,audioPlayer,avPlayer;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor grayColor];
       
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake((mScreenWidth-120)/2, 30, 120, 30)];
    [[btn layer] setCornerRadius:8];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(BtnActin) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"showPlayer" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}


-(void)BtnActin{


//    NSString *const krpShort = @"aaa";
//    NSString *urlStr = @"http://small.cdn.baidupcs.com/file/be06e0630674cfdcc8aad4f54ed9d95f?xcode=b3e242d2612f33c90dab0fd6263b84dd99b607e9db057517&fid=3878815629-250528-390723585252464&time=1399619139&sign=FDTAXER-DCb740ccc5511e5e8fedcff06b081203-6KtunpD8cXNGl1onKPQzRQCGBY4%3D&to=sc&fm=N,B,T,t&sta_dx=2&sta_cs=41&sta_ft=mp3&sta_ct=5&newver=1&expires=1399619739&rt=sh&r=177548827&logid=4088509707&sh=1&vuk=282335&fn=%E9%87%91%E7%8E%89%E8%89%AF%E7%BC%98.mp3";
    //
//    [self playWithUrl:nil orFileName:@"情非得已.mp3" playSouceFrom:PlaySourceFromLocalFile];

    UIDatePicker *datePick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 300, 0, 0)];
    [self.view addSubview:datePick];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)playWithUrl:(NSString *)pathUrl orFileName:(NSString *)fileName playSouceFrom:(PlaySource)souce{
    
    switch (souce) {
        case PlaySourceFromInternet:
        {
            if (pathUrl) {
                NSURL *URL = [NSURL URLWithString:pathUrl];
                avPlayer = [[AVPlayer alloc] initWithURL:URL];
                [avPlayer play];
            }
                   }
            break;
            default:{
            //创建路径资源，使用mainbundle
            NSString *videoPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
            //将路径转换为url
            NSURL *videoUrl = [[NSURL alloc] initFileURLWithPath:videoPath];
            //创建视频播放器
            mpMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:videoUrl];
            //当播放结束的消息发出后会调用定制好的方法“videoplayFinish”
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoplayFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
            [self.view addSubview:mpMovie.view];
        }
            break;
    }

}



-(void)updateProgress:(id)sender{

    
    
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    
    //  code here to play next sound file
    
}

-(void)pause{
    
    NSLog(@"pause");
    
}


-(void)videoplayFinish:(id)sender{

    NSLog(@"play over");
    [self.mpMovie.view removeFromSuperview];
}





@end
