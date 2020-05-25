//
//  DetailTableViewController.m
//  FFmpegLearn
//
//  Created by gavin hu on 2020/4/4.
//  Copyright © 2020 gavin hu. All rights reserved.
//

#import "VideoFormatViewController.h"
#import "VedioPlayViewController.h"

//#import "IJKFFMoviePlayerController.h"
@interface VideoFormatViewController ()
@property (nonatomic,strong) NSArray *postfix;
//@property (nonatomic,strong) KxMovieViewController *playerVC;
@end

@implementation VideoFormatViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.postfix = @[@"mp4",@"hevc",@"webm"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@_%@",self.datailTitle,[self.postfix objectAtIndex:indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * videoPath = [[NSBundle mainBundle] pathForResource:self.datailTitle ofType:[self.postfix objectAtIndex:indexPath.row]];
    if (videoPath) {
        VedioPlayViewController *playVC = [[VedioPlayViewController alloc] initWithPath:videoPath];
        [self.navigationController pushViewController:playVC animated:YES];
    }
    
}



@end
