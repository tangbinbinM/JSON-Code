//
//  TBBVideo.m
//  JSON转模型
//
//  Created by YiGuo on 2017/11/2.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "TBBVideo.h"

@implementation TBBVideo
//当JSON中键名与OC关键字重名时需要转为非关键字键名
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id",
             @"desc" : @"description"};
}
@end
