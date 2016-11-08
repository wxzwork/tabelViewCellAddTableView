//
//  ReplyCell.h
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReplyModel.h"
@protocol ReplyButtonDelegate <NSObject>

-(void)didClickReplyButtonWithCellIndexPath:(NSIndexPath *)cellIndexPath;


@end
@interface ReplyCell : UITableViewCell
@property(nonatomic, strong)UILabel *nameLabel;
@property(nonatomic, strong)UIImageView *avartarImageView;
@property(nonatomic, strong)UILabel *timeLabel;
@property(nonatomic, strong)UITextView *contentLabel;
@property(nonatomic, strong)UIButton *replyButton;
@property(nonatomic, strong)NSIndexPath *cellIndexPath;
@property(nonatomic, strong)ReplyModel *replyListData;
@property(nonatomic, assign)id<ReplyButtonDelegate> replyDelegate;
@end
