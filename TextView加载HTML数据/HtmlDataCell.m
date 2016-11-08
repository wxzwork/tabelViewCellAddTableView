//
//  HtmlDataCell.m
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "HtmlDataCell.h"
#import "Masonry.h"
#import "ReplyCell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
@implementation HtmlDataCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        _htmlTextView= [[UITextView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 30, 0)];
        [self.contentView addSubview:_htmlTextView];
        _htmlTextView.editable=NO;
        
        _htmlTextView.scrollEnabled = NO;
        _htmlTextView.delegate=self;
        _timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLabel];
        
        
        _replyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_replyButton];
        
        _lineLabel = [[UIView alloc] init];
        [self.contentView addSubview:_lineLabel];
        
        _replyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0) style:UITableViewStylePlain];
        [self.contentView addSubview:_replyTableView];
        
        _backImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_backImageView];
        
        _replyTableView.scrollsToTop = NO;
        
        
        _replyTableView.scrollEnabled = NO;
        
        [_replyTableView setSeparatorInset:UIEdgeInsetsMake(0, 28.5, 0, 28.5)];
        _replyTableView.backgroundColor = RGBACOLOR(246, 246, 246, 1.0f);
        _replyTableView.tableFooterView = [UIView new];
        
        
    
       
        
    }
    return self;
}
-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    NSLog(@"点击了链接URL%@",URL);
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange{
 
    NSLog(@"点击了图片%@",textAttachment);
    
    return YES;
}

-(void)layoutSubviews{
    [super layoutSubviews];
 
    self.htmlTextView.font = [UIFont systemFontOfSize:14];
    
    __weak __typeof(self) weakSelf = self;
    
    
    [self.htmlTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(weakSelf.htmlTextView.mas_bottom).offset(10);
    }];
    
    
    
    [self.replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(35);
        make.top.mas_equalTo(weakSelf.htmlTextView.mas_bottom).offset(0);
    }];
    
    
    
    
    [self.replyTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(self.contentView.frame.size.width);
        make.top.mas_equalTo(weakSelf.timeLabel.mas_bottom).offset(15);
        
    }];
    
    
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakSelf.replyButton.mas_left).offset(30);
        make.bottom.mas_equalTo(weakSelf.replyTableView.mas_top).offset(4);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, .3f));
        make.top.mas_equalTo(weakSelf.replyTableView.mas_bottom).offset(0);
    }];
    //
    _replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
 
    
    self.hyb_lastViewInCell = self.lineLabel;
    self.hyb_bottomOffsetToCell = 0;
    _replyButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_replyButton setTitleColor:RGBACOLOR(153, 153, 153, 1.0f) forState:UIControlStateNormal];
 
    _timeLabel.font = [UIFont systemFontOfSize:12];
    [_replyButton addTarget:self action:@selector(replyButtonAction) forControlEvents:UIControlEventTouchUpInside];
  
 
 
    
    _replyTableView.backgroundColor = RGBACOLOR(246, 246, 246, 1.0f);
    _lineLabel.layer.borderColor = RGBACOLOR(200, 200, 200, 1.0f).CGColor;
    _lineLabel.layer.borderWidth = .3f;
    _timeLabel.textColor = RGBACOLOR(153, 153, 153, 1.0f);
    
    
}
-(void)replyButtonAction{
    
    
    [self.replyDelagate didClickReplyButtonToReplyCommentContentWithCommentID:nil CellIndex:_cellIndex];
    
    
}
-(void)configCellWithModel:(DataModel *)listData indexPath:(NSIndexPath *)indexPath{
    _listData=listData;
   
    _htmlTextView.attributedText = listData.contentAttribute;
 
    
    [self.htmlTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([self.htmlTextView sizeThatFits:CGSizeMake(ScreenWidth - 30, CGFLOAT_MAX)].height);
    }];
    

    _timeLabel.text = listData.timeStr;
    
    if (listData.replyCount== 0) {
        
        [_replyButton setTitle:@" 回复" forState:UIControlStateNormal];
        
    }else{
        
        [_replyButton setTitle:[NSString stringWithFormat:@" 回复 %ld",listData.replyCount] forState:UIControlStateNormal];
        
    }
    
    
    
    CGFloat tableViewHeight = 0;
    if (listData.isDisplay == YES) {
        for (ReplyModel *commentModel in listData.replyListArray) {
            CGFloat cellHeight;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:_cellIndex];
            cellHeight =  [ReplyCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
                ReplyCell *cell = (ReplyCell *)sourceCell;
                cell.replyListData = commentModel;
            } cache:^NSDictionary *{
                return @{kHYBCacheUniqueKey : commentModel.replyID,
                         kHYBCacheStateKey : @"",
                         kHYBRecalculateForStateKey : @(NO)};
            }];
            tableViewHeight += cellHeight;
            _backImageView.image=[UIImage imageNamed:@"jiantou@2x"];
        }
        
        
    }else{
         _backImageView.image=[UIImage imageNamed:@""];
    }
    
    
    [self.replyTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(tableViewHeight);
        
    }];
    
    self.replyTableView.dataSource = self;
    self.replyTableView.delegate = self;
    [self.replyTableView reloadData];
   
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _listData.replyListArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    static NSString *identifier = @"replycell";
   ReplyCell *replycell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!replycell) {
        replycell = [[ReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row < _listData.replyListArray.count) {
        replycell.replyListData = _listData.replyListArray[indexPath.row];
               
    }
    replycell.cellIndexPath = indexPath;
    replycell.replyDelegate=self;
    replycell.backgroundColor = RGBACOLOR(246, 246, 246, 1.0f);
//    replycell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return replycell;
    
}
-(void)didClickReplyButtonWithCellIndexPath:(NSIndexPath *)cellIndexPath{
    [self.replyDelagate didClickReplyButtonWithCellIndex:_cellIndex];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReplyModel *model = [ReplyModel new];
    if (indexPath.row < _listData.replyListArray.count) {
        model =  [_listData.replyListArray objectAtIndex:indexPath.row];
    }
    CGFloat h = [ReplyCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        ReplyCell *replycell = (ReplyCell *)sourceCell;
        
        replycell.replyListData = model;
        
    } cache:^NSDictionary *{
        NSDictionary *dict = @{kHYBCacheUniqueKey: [NSString stringWithFormat:@"%@",model.replyID],
                               kHYBCacheForTableViewKey: tableView,
                               kHYBCacheStateKey: @"2",
                               kHYBRecalculateForStateKey:  @(NO)};
        return dict;
    }];
    
    return h;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
