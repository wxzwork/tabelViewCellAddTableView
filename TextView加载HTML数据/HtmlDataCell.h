//
//  HtmlDataCell.h
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "ReplyModel.h"
#import "ReplyCell.h"
@protocol ReplyCommentContetDelegate <NSObject>

-(void)didClickReplyButtonToReplyCommentContentWithCommentID:(NSString *)commentID CellIndex:(NSInteger)cellIndex;
//点击回复列表中的回复按钮
-(void)didClickReplyButtonWithCellIndex:(NSInteger)CellIndex;

@end

@interface HtmlDataCell : UITableViewCell<ReplyButtonDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@property(nonatomic, strong)UITextView *htmlTextView;
@property(nonatomic, strong)UITableView *replyTableView;
@property(nonatomic, strong)UILabel *timeLabel;
@property(nonatomic, strong)UIButton *replyButton;
@property(nonatomic, strong)UIImageView *backImageView;
@property(nonatomic, strong)UIView *lineLabel;
@property(nonatomic, assign)NSInteger  cellIndex;
@property(nonatomic, strong)DataModel *listData;
@property(nonatomic, assign)id<ReplyCommentContetDelegate> replyDelagate;
- (void)configCellWithModel:(DataModel *)listData indexPath:(NSIndexPath *)indexPath;
@end
