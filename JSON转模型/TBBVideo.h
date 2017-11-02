//
//  TBBVideo.h
//  JSON转模型
//
//  Created by YiGuo on 2017/11/2.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBBVideo : NSObject
/** ID */
@property (nonatomic, assign) NSInteger ID;
/** 视频名字 */
@property (nonatomic, copy) NSString *name;
/** 视频时长 */
@property (nonatomic, assign) NSInteger length;
/** 视频图片 */
@property (nonatomic, copy) NSString *image;
/** 视频文件路径 */
@property (nonatomic, copy) NSString *url;
@end
