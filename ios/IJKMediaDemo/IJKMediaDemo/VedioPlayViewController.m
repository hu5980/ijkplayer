//
//  PlayViewController.m
//  IJKMediaDemo
//
//  Created by gavin hu on 2020/4/7.
//  Copyright © 2020 bilibili. All rights reserved.
//

#import "VedioPlayViewController.h"
#import "IJKMoviePlayerViewController.h"

@interface VedioPlayViewController ()
@property (nonatomic,strong) IJKFFMoviePlayerController *player;
@property (nonatomic,strong) NSString *path;
@end

@implementation VedioPlayViewController

- (instancetype)initWithPath:(NSString *)path {
    if (self = [super init]) {
        self.path = path;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    
    [options setPlayerOptionIntValue:1 forKey:@"videotoolbox"];

   
    self.player =  [[IJKFFMoviePlayerController alloc]initWithContentURLString:self.path withOptions:options];
    [self.view addSubview:self.player.view];
    [self.player setShouldShowHudView:YES];
    self.player.view.frame = self.view.bounds;
    self.player.scalingMode = MPMovieScalingModeAspectFit;
    self.player.shouldAutoplay = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   [self.player prepareToPlay];
}

- (void)viewDidAppear:(BOOL)animated {
   
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player shutdown];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
