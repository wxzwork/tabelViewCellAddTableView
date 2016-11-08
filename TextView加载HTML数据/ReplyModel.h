//
//  ReplyModel.h
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReplyModel : NSObject
@property(nonatomic, copy)NSString *replyID;
@property(nonatomic, copy)NSString *reply;
@property(nonatomic, copy)NSString *createTimeStr;
@property(nonatomic, copy)NSString *UName;
@property(nonatomic, copy)NSString *UAvatar;

@end
