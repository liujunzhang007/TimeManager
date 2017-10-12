//
//  NSDateNote.m
//  TimeManager
//
//  Created by TourWay_iOS on 12/10/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import "NSDateNote.h"

@interface NSDateNote ()

@end

@implementation NSDateNote



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* *****时间格式*****
     G: 公元时代，例如AD公元
     yy: 年的后2位
     yyyy: 完整年
     MM: 月，显示为1-12
     MMM: 月，显示为英文月份简写,如 Jan
     MMMM: 月，显示为英文月份全称，如 Janualy
     dd: 日，2位数表示，如02
     d: 日，1-2位显示，如 2
     EEE: 简写星期几，如Sun
     EEEE: 全写星期几，如Sunday
     aa: 上下午，AM/PM
     H: 时，24小时制，0-23
     K：时，12小时制，0-11
     m: 分，1-2位
     mm: 分，2位
     s: 秒，1-2位
     ss: 秒，2位
     S: 毫秒
     */
    
    /* *****获得NSTimeInterval*****
     NSDate *date=[NSDate date];
     [date timeIntervalSince1970];//从1970年到现在的时间戳
     [date timeIntervalSinceDate:date];//从某一个时间到现在的时间戳
     [date timeIntervalSinceNow];//从现在开始的时间戳
     [date timeIntervalSinceReferenceDate];//从2001-01-01 00:00:00 +0000到现在的时间戳
     */
    
    /* *****获得时区时间*****
     [NSTimeZone systemTimeZone];//设置为系统的时区
     [NSTimeZone localTimeZone];//设置为本地的时区
     [NSTimeZone defaultTimeZone];//设置为用户默认时区
     [NSTimeZone knownTimeZoneNames];//获取已知地点的时区
     
     //通过地区名称获得时区
     for (NSString *name in [NSTimeZone knownTimeZoneNames]) {
     NSTimeZone *zone=[[NSTimeZone alloc]initWithName:name];
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
     //设定时间格式
     [formatter setDateFormat:@"YYYY-MM-d HH:mm:ss"];
     //设定时区
     [formatter setTimeZone:zone];
     //时间格式正规化并做时区校正
     NSString *correctDate = [formatter stringFromDate:[NSDate date]];
     NSLog(@"地点：%@ 当地时间：%@",[zone name], correctDate);
     }
     */
    
    /* *****系统中定义的日历*****
     系统中定义的日历有：
     
     NSGregorianCalendar -- 公历
     NSBuddhistCalendar -- 佛教日历 NSCalendarIdentifierBuddhist
     NSChineseCalendar -- 中国农历 NSCalendarIdentifierChinese
     NSHebrewCalendar -- 希伯来日历 NSCalendarIdentifierHebrew
     NSIslamicCalendar -- 伊斯兰历 NSCalendarIdentifierIslamic
     NSIslamicCivilCalendar -- 伊斯兰教日历 NSCalendarIdentifierIslamicCivil
     NSJapaneseCalendar -- 日本日历 NSCalendarIdentifierJapanese
     NSRepublicOfChinaCalendar -- 中华民国日历（台湾）NSCalendarIdentifierRepublicOfChina
     NSPersianCalendar -- 波斯历 NSCalendarIdentifierPersian
     NSIndianCalendar -- 印度日历 NSCalendarIdentifierIndian
     NSISO8601Calendar -- ISO8601 NSCalendarIdentifierISO8601
     
     
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierBuddhist            NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierChinese             NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierCoptic              NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierEthiopicAmeteMihret NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierEthiopicAmeteAlem   NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierHebrew              NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierISO8601             NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierIndian              NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierIslamic             NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierIslamicCivil        NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierJapanese            NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierPersian             NS_AVAILABLE(10_6, 4_0);
     FOUNDATION_EXPORT NSString * const NSCalendarIdentifierRepublicOfChina     NS_AVAILABLE(10_6, 4_0);
     
     */
    
    /* *****NSCalendarUnit*****
     NSCalendarUnit包含的值有：
     
     NSEraCalendarUnit -- 纪元单位。对于NSGregorianCalendar(公历)来说，只有公元前(BC)和公元(AD)；而对于其它历法可能有很多，例如日本和历是以每一代君王统治来做计算。
     NSYearCalendarUnit -- 年单位。值很大，相当于经历了多少年，未来多少年。
     NSMonthCalendarUnit -- 月单位。范围为1-12
     NSDayCalendarUnit -- 天单位。范围为1-31
     NSHourCalendarUnit -- 小时单位。范围为0-24
     NSMinuteCalendarUnit -- 分钟单位。范围为0-60
     NSSecondCalendarUnit -- 秒单位。范围为0-60
     NSWeekCalendarUnit -- 周单位。范围为1-53
     NSWeekdayCalendarUnit -- 星期单位，每周的7天。范围为1-7
     NSWeekdayOrdinalCalendarUnit -- 没完全搞清楚
     NSQuarterCalendarUnit -- 几刻钟，也就是15分钟。范围为1-4
     NSWeekOfMonthCalendarUnit -- 月包含的周数。最多为6个周
     NSWeekOfYearCalendarUnit -- 年包含的周数。最多为53个周
     NSYearForWeekOfYearCalendarUnit -- 没完全搞清楚
     NSTimeZoneCalendarUnit -- 没完全搞清楚
     
     
     NSCalendarUnitEra                = kCFCalendarUnitEra,
     NSCalendarUnitYear               = kCFCalendarUnitYear,
     NSCalendarUnitMonth              = kCFCalendarUnitMonth,
     NSCalendarUnitDay                = kCFCalendarUnitDay,
     NSCalendarUnitHour               = kCFCalendarUnitHour,
     NSCalendarUnitMinute             = kCFCalendarUnitMinute,
     NSCalendarUnitSecond             = kCFCalendarUnitSecond,
     NSCalendarUnitWeekday            = kCFCalendarUnitWeekday,
     NSCalendarUnitWeekdayOrdinal     = kCFCalendarUnitWeekdayOrdinal,
     NSCalendarUnitQuarter            NS_ENUM_AVAILABLE(10_6, 4_0) = kCFCalendarUnitQuarter,
     NSCalendarUnitWeekOfMonth        NS_ENUM_AVAILABLE(10_7, 5_0) = kCFCalendarUnitWeekOfMonth,
     NSCalendarUnitWeekOfYear         NS_ENUM_AVAILABLE(10_7, 5_0) = kCFCalendarUnitWeekOfYear,
     NSCalendarUnitYearForWeekOfYear  NS_ENUM_AVAILABLE(10_7, 5_0) = kCFCalendarUnitYearForWeekOfYear,
     NSCalendarUnitNanosecond         NS_ENUM_AVAILABLE(10_7, 5_0) = (1 << 15),
     NSCalendarUnitCalendar           NS_ENUM_AVAILABLE(10_7, 4_0) = (1 << 20),
     NSCalendarUnitTimeZone           NS_ENUM_AVAILABLE(10_7, 4_0) = (1 << 21),
     
     
     
     */
    
    [self NStimer];
    
    
//    ActionTestView *actionView = [[ActionTestView alloc]init];
//    actionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
//    actionView.backgroundColor = [UIColor greenColor];
//    actionView.action = @selector(actionTest);
//    [self.view addSubview:actionView];
    
}
- (void)actionTest{
    NSLog(@"action,action,action");
}
-(void)NStimer{
    
    //获得指定时间之后的日期
    int days=10;
    NSDate *date=[NSDate date];
    NSTimeInterval time=days*24*60*60;
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z a"];
    NSString *timerStr = [formatter stringFromDate:[date dateByAddingTimeInterval:time]];
    
    [date dateByAddingTimeInterval:time];
    NSLog(@"十天之后的日期(格林尼治时间):%@",date);
    NSLog(@"十天以后的日期:%@",timerStr);
    
    
    //时间戳转换成日期
    NSTimeInterval integer=[date timeIntervalSince1970];
    NSDate *currentDate=[[NSDate alloc]initWithTimeIntervalSince1970:integer];
    NSString *timerCurrentStr=[formatter stringFromDate:currentDate];
    NSLog(@"时间戳转换成日期:%@",timerCurrentStr);
    
    //日期转换成时间戳
    NSTimeInterval currentTimeInrerval=[currentDate timeIntervalSince1970];
    NSLog(@"日期转换成时间戳:%f秒",currentTimeInrerval);
    
    
    NSLog(@"格林尼治时间:%@",date);
    //获取本地时间
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *localTime=[formatter stringFromDate:date];
    NSLog(@"获取本地时间:%@",localTime);
    //获取系统时间
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *systemTime=[formatter stringFromDate:date];
    NSLog(@"获取系统时间:%@",systemTime);
    //获取默认时间
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    NSString *defaultTime=[formatter stringFromDate:date];
    NSLog(@"获取默认时间:%@",defaultTime);
    
    
    
    //获得系统时间
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateformatter setDateFormat:@"HH:mm:ss"];
    NSString *  timeString=[dateformatter stringFromDate:[NSDate date]];
    
    
    /* **************从nscalendar中获取年月日，从nstimezone中获取时区************** */
    
    //    NSCalendar *calendar = [[NSLocale currentLocale] objectForKey:NSLocaleCalendar];//也可以使用[NSCalendar  currentCalendar];
    
    //设置日历种类 （中国农历）
    NSCalendar *calendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    //8421码二进制求和，这些枚举的声明符合MISRA C Coding Standard
    NSUInteger mask = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    //NSDateComponents对象表示一个日期对象的组件——例如年，月，日和小时。如果要使一个NSDateComponents对象有意义，你必须将其与一个日历对象相关联。
    NSDateComponents * dateConponent= [calendar components:mask fromDate:[NSDate date]];
    
    NSString *nsDateString= [NSString  stringWithFormat:@"%ld/%ld/%ld/- %@", (long)[dateConponent year], (long)[dateConponent month], (long)[dateConponent day],timeString];
    NSLog(@"中国农历时间:%@",nsDateString);
    
}


@end
