//
//  ViewController.m
//  TextView加载HTML数据
//
//  Created by WOSHIPM on 16/11/7.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "HtmlDataCell.h"
#import "DataModel.h"
#import "ReplyModel.h"
#import "ReplyCell.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
@interface ViewController ()<ReplyCommentContetDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray = [NSMutableArray array];
    [self getData];
    
}
-(void)loadView{
    [super loadView];
    self.navigationController.navigationBar.translucent=NO;
    [self.view addSubview:self.tableView];
    
    
}
-(void)getData{
    NSString *str= @"<p>这句话能刺激到的都是广大在为房为车为孩子为梦想在前线艰苦奋斗的人民群众，多少人奋斗了一辈子连一百万都存不了，一个亿是想都不敢想的，能说出这话来的除了各大爸爸之外也没谁有这样的口气了。主要是他说了我们不敢想象的事情，一个亿对于他们来说是分分钟的事情，这阶层的差距真的细思恐极。</p><p>能造成传播的也抓住了对比反差的热点营销了。 </p>";
    NSString *str1=@"<p>一个亿啊，普通人不要说一个亿了，要熬多久才能有个一百万？王首富是站在自己的角度来设定一个做首富的场景无可厚非，但是对于广大吃瓜群众来说就有点讽刺了。这完全诠释了一句话：理想很丰满，显示很骨感，打了所有在座群众的脸。</p>";
    
    NSString *str2=@"<p>现在互联网，断章取义的东西大家最喜欢玩了，本来是个很严肃很励志的一句话，但是把头尾一截，就变得很有趣味了</p><p><br/></p><p>先订一个能达到的小目标（严肃认真脸.jpg）</p><p>比方说我先挣它一个亿（严肃轻松脸.png）</p><p><img src=\"http://img.woshipm.com/TTW_QUESTION_201608_20160829170712_0539.jpg\" title=\"\" width=\"385\" height=\"415\" style=\"width: 385px; height: 415px;\"/></p><p>首尾的强大反差给人一种无奈到好笑的感觉，跟比尔盖茨很有名的那张3秒赚辆兰博基尼有异曲同工之妙。</p><p><br/></p><p>说的随便点吧，就是大家觉得这东西好玩搞笑，极具讽刺性，跟大家的生活现状形成强烈的对比，明明就是苦逼屌丝一辈子赚不到一千万的角儿，却要看着人家定个小目标随便弄他一个亿，我的妈呀，人与人之间的差别距离好几个爹呀。</p><p>互联网现在信息传递快，大家爱自嘲、爱起哄，像这种能够开名人玩笑，为生活补充点乐子的事，而且还能表达一下自己对生活的挖苦、讽刺，所以转了也就转了<br/></p>";
    NSString *str3=@"<p>1、因为内容有话题性。钱本来就是大部分的痛点，更何况首富设计到财富观的东西；</p><p>2、为什么《万万没想到会》愿意分享，因为有彩蛋，有反差有惊喜，出乎预料的感觉。1个亿对于大部分用户来说都是无法触及的，却被首富面前说得那么云淡风轻~~</p><p>现在互联网氛围多爱嘲讽、吐槽、起哄什么的，很浮躁的~~</p>";
    NSString *str4=@"<p>早上莫名其妙被王健林的小目标给刷屏了，表示真的很莫名其妙，一点也不认为这有什么好刷屏的；<br/><br/>对于不同的人而言，本来所处的层次不同、视野不同、格局不同，所设定的目标自然而然就会有差别；对于王健林说的一个亿是小目标，一点都不觉得奇怪；有钱人有有钱人的淡然，普通人有普通人的情调哦；</p><p><br/></p><p>之所以吃瓜群众会疯转，我觉得是因为那是对自己来说遥不可及的事情，但在别人的口中确是如此云淡风轻，那就顶成热点，大家一起吐个槽装个逼呗；</p><p><br/></p><p>总结一句就是：屌丝看到比自己成功的人，总是想在人家的生活里面插一脚，而互联网提供了这样的机会</p>";
    NSString *str5=@"想做首富的方向很好，但是先给自己定给小目标，例如先在三五年之内挣它一个亿再说。如果这句话是其他的人说出来的，人们可能付之一笑，然后抛诸脑后。但是说这话的人是王健林，他是中国首富，人家说这话有资本，有实力，很轻松。而在电视机电脑手机前面的人民群众却不仅仅付之一笑，内心肯定是五味杂陈，我等一介小民，怎么才能跟他比？人家有实力说出这样的话，我们也只能羡慕嫉妒恨一下了。这就戳到了大家的痛点，为什么你能赚那么多而我就每个月盼着这么点工资？为什么你能轻轻松松说这样的话而我就只能苦笑看着你？看着别人口中的小目标是自己大概一辈子也达不到的目标，心中也只能现在山脚下仰望他。这句话如果换做是马云或者是潘石屹等各位爸爸说出来的，肯定也是这样的效果！最重要的是钱几乎是每个人心中的痛点，我想这也是为什么能够广泛传播的原因吧！";
    NSString *str6=@"<p>巨大的期望背后的心理落差，在王健林这种貌似不拘言笑的人说出来有一种剧情特别反转的效果。</p><p>其实说白了，就是转折在大家意料之外而已。</p><p>但是，这就是人家的生活</p><p>在我们看起来很不正常的事儿，对他们来说在正常不过。</p><p>所以我们会觉得好笑</p>";
    NSString *str7=@"<p>将最终的目标分解，先定一个小目标，一步一步的实现，一个一直存在的方法，却被某爸的“先赚一个亿”，刺痛了多少为生存挣扎的普通百姓，但也说的在理，凡事一步一步来<img src=\"http://img.baidu.com/hi/ldw/w_0051.gif\"/></p>";
    NSArray *arr=@[str,str1,str2,str3,str4,str5,str6,str7];
    
    
    for (NSInteger i=0; i <arr.count; i++) {
        DataModel *dataModel=[DataModel new];
        dataModel.contentAttribute=[self changeHtmlStringToAttributeString:arr[i]];
        dataModel.timeStr=[NSString stringWithFormat:@"2016-11-%ld",i+1];
        dataModel.shouldUpdateCache=YES;
        dataModel.isDisplay=YES;
        NSUInteger randCount = arc4random() % 4 + 1;
        
        for (NSUInteger j = 0; j < randCount; j++) {
            ReplyModel *replyModel = [[ReplyModel alloc] init];
            replyModel.UName = @"我";
            replyModel.reply = @"这是二级回复内容";
            replyModel.replyID = [NSString stringWithFormat:@"%ld", j + 1];
            
            replyModel.createTimeStr=[NSString stringWithFormat:@"2016-11-%ld",j+1];
            [dataModel.replyListArray addObject:replyModel];
        }
        dataModel.replyCount=dataModel.replyListArray.count;
        
        [_dataArray addObject:dataModel];
    }
    

}

-(UITableView *)tableView{
    if (  nil ==_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.scrollsToTop = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_dataArray.count != 0) {
        
        DataModel *model = [DataModel new];
        if (indexPath.row < _dataArray.count) {
            model =  [self.dataArray objectAtIndex:indexPath.row];
            
        }
        
        CGFloat h = [HtmlDataCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HtmlDataCell *cell = (HtmlDataCell *)sourceCell;
            
            if (indexPath.section < _dataArray.count) {
                
                [cell configCellWithModel:model indexPath:indexPath];
            }
            
        } cache:^NSDictionary *{
            NSString *UniqueKey;
            
            UniqueKey=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
        
            NSDictionary *cache = @{kHYBCacheUniqueKey : UniqueKey,
                                    kHYBCacheStateKey: @"2",
                                    kHYBRecalculateForStateKey : @(model.shouldUpdateCache),
                                    kHYBCacheForTableViewKey:tableView};
            model.shouldUpdateCache = NO;
            
            return cache;
            
        }];
        
        return h;
        
        
    }else{
        return 0;
    }
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
        
        static NSString *identifier = @"cell";
        HtmlDataCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[HtmlDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        if (_dataArray.count != 0){
            [cell configCellWithModel:_dataArray[indexPath.row] indexPath:indexPath];
            //        cell.listData = _anwersListArray[indexPath.section];
            cell.cellIndex = indexPath.row;
          
            
        }
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.replyDelagate =self;
        return cell;
        
      
}

-(void)didClickReplyButtonToReplyCommentContentWithCommentID:(NSString *)commentID CellIndex:(NSInteger)cellIndex{
    
   
        
        if ([_dataArray[cellIndex] isDisplay] == NO) {
            
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:cellIndex inSection:0];
            
            DataModel *model = _dataArray[cellIndex];
            HtmlDataCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
            
            model.shouldUpdateCache=YES;
            model.isDisplay = YES;
            
            [cell configCellWithModel:model indexPath:indexPath];
            [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            
            
        }else{
            
            DataModel *model = _dataArray[cellIndex];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:cellIndex inSection:0];
            HtmlDataCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
            model.isDisplay = NO;
            //            cell.listData = model;
            model.shouldUpdateCache=YES;
            [cell configCellWithModel:model indexPath:indexPath];
            [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            
            
        }
        
        
  
    
    
}
-(NSMutableAttributedString *)changeHtmlStringToAttributeString:(NSString *)htmlString{
    NSString *newString = htmlString;
    

  //图片自适应宽高，只限制图片的最大显示宽度，这样就能做到自适应
    newString =[NSString stringWithFormat:@"<html>"
                "<head>"
                
                "</style>"
                "<style>*{margin:3px 0px 3px 0px;padding:0 ;max-width:%f;}</style>"
                "</head>"
                "<body>%@</body>"
                "</html>",self.view.frame.size.width-30,newString];
    NSData *data = [newString dataUsingEncoding:NSUnicodeStringEncoding];
    
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSMutableAttributedString *htmlAttribute = [[NSMutableAttributedString alloc] initWithData:data
                                                                                       options:options
                                                                            documentAttributes:nil
                                                                                         error:nil];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
        //设置文字的行间距
        [paragraphStyle setLineSpacing:5];
        
        [htmlAttribute addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [htmlAttribute length])];
    //设置文字的颜色
    [htmlAttribute addAttribute:NSForegroundColorAttributeName value:RGBACOLOR(51, 51, 51, 1) range:NSMakeRange(0, htmlAttribute.length)];
    
     //设置文字的大小
    [htmlAttribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, htmlAttribute.length)];
   
    return htmlAttribute;
    
}

-(void)didClickReplyButtonWithCellIndex:(NSInteger)CellIndex{
    DataModel *model = _dataArray[CellIndex];
    NSIndexPath *cellidex = [NSIndexPath indexPathForRow:CellIndex inSection:0];
   HtmlDataCell *cell = (HtmlDataCell*)[_tableView cellForRowAtIndexPath:cellidex];
    ReplyModel *replyModel = [[ReplyModel alloc] init];
    replyModel.UName = @"你回复我";
    replyModel.reply = @"说的好有道理呢";
    replyModel.replyID = [NSString stringWithFormat:@"%ld", model.replyListArray.count + 1];
    
    replyModel.createTimeStr=[NSString stringWithFormat:@"2016-11-%ld",model.replyCount+1];
    [model.replyListArray addObject:replyModel];
    model.replyCount = model.replyCount+1;
    model.isDisplay=YES;
    model.shouldUpdateCache=YES;
    
    
    [cell configCellWithModel:model indexPath:cellidex];
    
  
    [self.tableView reloadRowsAtIndexPaths:@[cellidex] withRowAnimation:UITableViewRowAnimationFade];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
