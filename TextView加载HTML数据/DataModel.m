//
//  DataModel.m
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (NSMutableArray *)replyListArray {
    
    if (_replyListArray == nil) {
        _replyListArray = [[NSMutableArray alloc] init];
    }
    
    return _replyListArray;
}


@end
