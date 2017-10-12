//
//  NSDate+Calendar.m
//  TimeManager
//
//  Created by TourWay_iOS on 13/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import "NSDate+Calendar.h"

@implementation NSDate (Calendar)

+ (NSInteger)getNumberOfDaysInMonth
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDate * currentDate = [NSDate date];
    // 只要个时间给日历,就会帮你计算出来。这里的时间取当前的时间。
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:currentDate];
    return range.length;
}
+ (NSDateComponents *)getDateInfoWithDate:(NSDate *)date{
    if (!date) {
        date = [NSDate date];
    }
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法 NSCalendarIdentifierGregorian,NSGregorianCalendar
    // NSDateComponent 可以获得日期的详细信息，即日期的组成
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekday|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekdayOrdinal fromDate:date];
    
//    NSLog(@"年 = year = %ld",comps.year);
//    NSLog(@"月 = month = %ld",comps.month);
//    NSLog(@"日 = day = %ld",comps.day);
//    NSLog(@"时 = hour = %ld",comps.hour);
//    NSLog(@"分 = minute = %ld",comps.minute);
//    NSLog(@"秒 = second = %ld",comps.second);
//    NSLog(@"星期 = weekDay = %ld ",comps.weekday);
//    NSLog(@"weekOfYear = %ld",comps.weekOfYear);
//    NSLog(@"weekOfMonth = %ld",comps.weekOfMonth);
//    NSLog(@"weekdayOrdinal = %ld",comps.weekdayOrdinal);
    
    return comps;
}


@end
