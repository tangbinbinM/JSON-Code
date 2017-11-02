//
//  ViewController.m
//  JSON转模型
//
//  Created by YiGuo on 2017/11/2.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"
#import <MJExtension/MJExtension.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <MediaPlayer/MediaPlayer.h>
#import "TBBVideo.h"
@interface ViewController ()
/** 视频数据 */
@property (nonatomic, strong) NSArray *videos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取数字
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 解析JSON
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        // 获得视频的模型数组
        self.videos = [TBBVideo mj_objectArrayWithKeyValuesArray:dict[@"videos"]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 刷新表格
            [self.tableView reloadData];
        }];
    }];
}
#pragma mark -- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videos.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Id = @"video";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    TBBVideo *videoModel = self.videos[indexPath.row];
    cell.textLabel.text = videoModel.name;
    cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"时长：%zd",videoModel.length];
    NSString *image = [@"http://120.25.226.186:32812"stringByAppendingPathComponent:videoModel.image];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"icn"]];
    return cell;
}
#pragma mark -- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TBBVideo *videoModel = self.videos[indexPath.row];
    NSString *urlStr = [@"http://120.25.226.186:32812" stringByAppendingPathComponent:videoModel.url];
    
    // 创建视频播放器
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:urlStr]];
    
    // 显示视频
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
