//
//  ViewController.m
//  FFMpegLearn
//
//  Created by gavin hu on 2020/3/29.
//  Copyright © 2020 gavin hu. All rights reserved.
//

#import "VideoRateViewController.h"
#import "VideoFormatViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
@interface VideoRateViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSString *h264_videoPath;
@property (nonatomic,strong)NSMutableArray *titleArrays;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation VideoRateViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    IJKFFSupportFormat *support = [IJKFFSupportFormat new];
    [support supportVedioFormat];
    [self initDatas];
    [self initUI];
}

- (void)initUI {
    self.title = @"码率列表";
    _tableView = [UITableView new];
    _tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


- (void)initDatas {
    if (!self.titleArrays) {
        self.titleArrays = [NSMutableArray array];
        for (int i  =0; i<20; i++) {
            NSString *titles =  [NSString stringWithFormat:@"绝地求生-持枪奔跑_1080P_CRF20_VBVMaxRate%d",500+i*500];
            [self.titleArrays addObject:titles];
        }
        
        [self.titleArrays addObject:@"故宫晶华烤鸭与美女_960x540_av1"];
    }
}

#pragma --mark tableview delegate datesource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
    }
    cell.textLabel.text = [self.titleArrays objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoFormatViewController *detailVC = [VideoFormatViewController new];
    detailVC.datailTitle = [self.titleArrays objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
