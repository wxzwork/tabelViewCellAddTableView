//
//  DataModel.h
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic, assign)NSInteger  replyCount;
@property(nonatomic, copy)NSString *timeStr;
@property(nonatomic, copy)NSMutableAttributedString *contentAttribute;
@property (nonatomic, strong) NSMutableArray *replyListArray;//回复数组

/**
 *  是否展示回复列表
 */
@property(nonatomic, assign)BOOL isDisplay;
// 因为评论是动态的，因此要标识是否要更新缓存
@property (nonatomic, assign) BOOL shouldUpdateCache;


@end
