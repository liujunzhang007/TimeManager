//
//  MainPageViewController.m
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import "MainPageViewController.h"
#import "WeekScheduleTableViewCell.h"
#import "TimeModel.h"
#import "NSDate+Calendar.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface MainPageViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    UIScrollView *_mainScorllView;
    UITableView *_GridView;
    NSMutableArray *_dataArray;
    NSInteger _TimePartPerDay;
    UIButton *_FunctionDot;
    UIView *_backView;
    UIView *_functionView;
    UIView *_timeLabelView;
}

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorTransferToRGB:@"#fffbe4"]];
    self.navigationController.navigationBar.hidden=YES;
    
    UIImageView *backGroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    backGroundImage.contentMode = UIViewContentModeScaleAspectFill;
    [backGroundImage setImage: [UIImage imageNamed:@"IMG_6272.JPG"]];
    [self.view addSubview:backGroundImage];
    
    UIView *stateBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    stateBarView.backgroundColor = [UIColor colorTransferToRGB:@"#fffbe4"];
    [self.view addSubview:stateBarView];
    
    _TimePartPerDay = 34;
    [self setData];
    [self setUI];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(significantTimeChange)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(currentLocaleDidChange)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
}
- (void)setData{
    _dataArray = [[NSMutableArray alloc]init];
    for (int i=0; i<7; i++) {
        TimeModel *dayModel = [[TimeModel alloc]init];
        dayModel.DataArray = [[NSMutableArray alloc]init];
        for (int j=0; j<34; j++) {
            TimeModel *hourModel = [[TimeModel alloc]init];
            hourModel.textTitle = [NSString stringWithFormat:@"%d-%d",i,j];
            hourModel.color = [UIColor whiteColor];
            hourModel.section = i;
            hourModel.item = j;
            hourModel.color = nil;
            [dayModel.DataArray addObject:hourModel];
        }
        [_dataArray addObject:dayModel];
    }
}
- (void)setUI{
    if (_mainScorllView == nil) {
        _mainScorllView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight)];
        _mainScorllView.bounces = NO;
        _mainScorllView.backgroundColor = [UIColor clearColor];
        _GridView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, TimeButtonWidth*(34+1), kScreenHeight-self.tabBarController.tabBar.frame.size.height-20) style:UITableViewStylePlain];
        _GridView.backgroundColor = [UIColor clearColor];
        _GridView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _GridView.delegate = self;
        _GridView.dataSource = self;
        _GridView.bounces = NO;
        [_mainScorllView addSubview:_GridView];
//        _mainScorllView.contentSize = CGSizeMake(TimeButtonWidth*(34+1)+35, kScreenHeight-64);
        _mainScorllView.contentSize = _GridView.frame.size;
        [self.view addSubview:_mainScorllView];
    }
    if (_FunctionDot == nil) {
        _FunctionDot = [UIButton buttonWithType:UIButtonTypeCustom];
        _FunctionDot.frame = CGRectMake(kScreenWidth-50, kScreenHeight-TimeButtonHeight-25-44, 50, 50);
        _FunctionDot.backgroundColor = [UIColor blackColor];
        _FunctionDot.layer.cornerRadius = 10;
        _FunctionDot.alpha = 0.4;
        [_FunctionDot addTarget:self action:@selector(functionDotAction:) forControlEvents:UIControlEventAllEvents];
        [self.view addSubview:_FunctionDot];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeekScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeekScheduleTableViewCell"];
    if (cell == nil) {
        cell = [[WeekScheduleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WeekScheduleTableViewCell"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    TimeModel *model = _dataArray[indexPath.item];
    [cell setDataWithModel:model];
    [cell setTimeButtonBlock:^(NSString *text) {
        NSLog(@"%@",text);
        NSArray *arr = [text componentsSeparatedByString:@"-"];
        NSString *section = arr.firstObject;
        NSString *item = arr.lastObject;
        TimeModel *model = _dataArray[[section integerValue]];
        TimeModel *subModel = model.DataArray[[item integerValue]];
        if (subModel.color == nil) {
            subModel.color = [UIColor grayColor];
        }
        else{
            subModel.color = nil;
        }
        [_GridView reloadData];
    }];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TimeButtonHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0000001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return [self setHeadView];
}
- (UIView *)setHeadView{
    if (_timeLabelView != nil) {
        [_timeLabelView removeFromSuperview];
        _timeLabelView = nil;
    }
    _timeLabelView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, TimeButtonWidth*(34+1)+35, 50)];
    _timeLabelView.backgroundColor = [UIColor colorTransferToRGB:@"#fffbe4"];
    //当前时间
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"]; // 年-月-日
    NSDate *currentDate = [NSDate date];
    NSTimeInterval currentInterval = [currentDate timeIntervalSince1970];
    
    TimeModel *model = _dataArray.firstObject;
    UILabel *timeLabelEmpty = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, TimeButtonWidth, 50)];
    timeLabelEmpty.backgroundColor = [UIColor clearColor];
    timeLabelEmpty.layer.borderWidth = 1;
    timeLabelEmpty.numberOfLines = 0;
    timeLabelEmpty.layer.borderColor = [UIColor colorTransferToRGB:@"#eeeeee"].CGColor;
    timeLabelEmpty.text = [NSString stringWithFormat:@"第%ld周\n%@",[NSDate getDateInfoWithDate:nil].weekOfYear,[formatter stringFromDate:currentDate]];
    timeLabelEmpty.font = [UIFont boldSystemFontOfSize:10];
    timeLabelEmpty.textColor = [UIColor colorTransferToRGB:@"#333333"];
    timeLabelEmpty.textAlignment = NSTextAlignmentCenter;
    [_timeLabelView addSubview:timeLabelEmpty];
    CGFloat timeLabel_x = TimeButtonWidth;
    
    //初始化开始时间
    NSString *HHmm = @"7:00";
    NSString * dateStr = [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:currentDate],HHmm];
    NSDateFormatter * formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy-MM-dd HH:mm"]; // 年-月-日 时:分:秒
    NSDate * date = [formatter2 dateFromString:dateStr];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];

    for (TimeModel *submodel in model.DataArray) {
        
        //时间段
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm"]; //只获取月和日的数据
        NSDate * dateup = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSString * dateStringUp = [formatter stringFromDate:dateup];//开始时间
        timeInterval+=30*60;
        NSDate * datedown = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSString * dateStringdown = [formatter stringFromDate:datedown];//结束时间
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(timeLabel_x, 0, TimeButtonWidth, 50)];
        timeLabel_x+=TimeButtonWidth;
        timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.layer.borderWidth = 1;
        timeLabel.layer.borderColor = [UIColor colorTransferToRGB:@"#eeeeee"].CGColor;
        if (currentInterval>[dateup timeIntervalSince1970]&&currentInterval<=[datedown timeIntervalSince1970]) {
            timeLabel.layer.borderColor = [UIColor redColor].CGColor;
            timeLabel.layer.borderWidth = 2;
        }
        timeLabel.numberOfLines = 0;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = [UIFont systemFontOfSize:10];
        timeLabel.text = [NSString stringWithFormat:@"%@\n-\n%@",dateStringUp,dateStringdown];
        [_timeLabelView addSubview:timeLabel];
    }
    return _timeLabelView;
}

- (void)functionDotAction:(UIButton *)button{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (_backView == nil) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2DismissDot:)];
        [_backView addGestureRecognizer:tap];
        
        _functionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        _functionView.center = window.center;
        _functionView.backgroundColor = [UIColor blackColor];
        _functionView.alpha = 0.7;
        _functionView.layer.cornerRadius = 10;
        
        
        
        [window addSubview:_functionView];
        [window addSubview:_backView];
        [UIView animateWithDuration:0.5f animations:^{
            _functionView.frame = CGRectMake(0, 0, kScreenWidth - 40, kScreenWidth *0.7);
            _functionView.center = window.center;
            button.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (void)tap2DismissDot:(UITapGestureRecognizer *)tap{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [UIView animateWithDuration:0.5f animations:^{
        _functionView.frame = CGRectMake(0, 0, 0, 0);
        _functionView.center = window.center;
        _FunctionDot.alpha = 0.4;
        _backView.alpha = 0;
    } completion:^(BOOL finished) {
        [_functionView removeFromSuperview];
        _functionView = nil;
        [_backView removeFromSuperview];
        _backView = nil;
    }];
}

- (void)significantTimeChange
{
    // todo: Refresh the interface.
    NSLog(@"significantTimeChange");
    [_GridView reloadData];
    [self setHeadView];
}

- (void)currentLocaleDidChange
{
    // todo: Refresh the interface.
    NSLog(@"currentLocaleDidChange");
    [_GridView reloadData];
    [self setHeadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
