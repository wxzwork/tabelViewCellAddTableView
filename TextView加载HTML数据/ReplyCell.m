//
//  ReplyCell.m
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "ReplyCell.h"
#import "Masonry.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
@implementation ReplyCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _nameLabel= [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        _timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLabel];
        
        _replyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_replyButton];
        
       
        
        _contentLabel = [[UITextView alloc] init];
        [self.contentView addSubview:_contentLabel];
        
        _avartarImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_avartarImageView];
        self.contentLabel.editable=NO;
        self.contentLabel.scrollEnabled=NO;
        self.contentLabel.backgroundColor=[UIColor clearColor];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.avartarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.mas_equalTo(28.5);
        make.top.mas_equalTo(10);
        
        
    }];
    
    _avartarImageView.layer.cornerRadius = 2;
    _avartarImageView.layer.masksToBounds = YES;
 
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avartarImageView.mas_left).offset(27);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];
    
    
    _nameLabel.font = [UIFont systemFontOfSize:12];
     
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avartarImageView.mas_left).offset(0);
        make.right.mas_equalTo(-28.5);
        make.top.mas_equalTo(_avartarImageView.mas_bottom).offset(7);
    }];
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avartarImageView.mas_left).offset(0);
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(7);
    }];
  
    [self.replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-28.5);
        
        make.size.mas_equalTo(CGSizeMake(60, 33));
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(0);
    }];
    
    
    _contentLabel.font = _nameLabel.font;
    //    _contentLabel.numberOfLines = 0;
    _contentLabel.textColor = RGBACOLOR(102, 102, 102, 1.0f);
    
    _timeLabel.textColor=RGBACOLOR(153, 153, 153, 1.0f);
    _timeLabel.font = [UIFont systemFontOfSize:12];
    
    [_replyButton addTarget:self action:@selector(replyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _replyButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_replyButton setTitleColor:RGBACOLOR(153, 153, 153, 1.0f) forState:UIControlStateNormal];
    self.hyb_bottomOffsetToCell = 15;
    self.hyb_lastViewInCell = _timeLabel;
    _nameLabel.font = [UIFont systemFontOfSize:12];
    _avartarImageView.backgroundColor=[UIColor blueColor];
}

-(void)replyButtonAction{
    
    [self.replyDelegate didClickReplyButtonWithCellIndexPath:_cellIndexPath];
}
-(void)setCellIndexPath:(NSIndexPath *)cellIndexPath{
    _cellIndexPath = cellIndexPath;
}
-(void)setReplyListData:(ReplyModel *)replyListData{
  
    _replyListData = replyListData;
    
            NSString *nameStr = replyListData.UName;
            NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",nameStr]];
            [attribute setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGBACOLOR(51, 51, 51, 1.0f)} range:NSMakeRange(0, nameStr.length)];
            _nameLabel.attributedText = attribute;
      
        
        
    
    [_replyButton setTitle:@"回复" forState:UIControlStateNormal];
   
    _contentLabel.text = replyListData.reply;
 
    [_contentLabel sizeToFit];
    
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([self.contentLabel sizeThatFits:CGSizeMake(ScreenWidth - 57, CGFLOAT_MAX)].height);
    }];
    _timeLabel.text = replyListData.createTimeStr;
    
  
    
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
