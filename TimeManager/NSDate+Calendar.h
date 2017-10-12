//
//  NSDate+Calendar.h
//  TimeManager
//
//  Created by TourWay_iOS on 13/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Calendar)
/**
 获取当月的天数
 */
+ (NSInteger)getNumberOfDaysInMonth;
/**
 *    NSCalendarUnitWeekday
 *     获取指定日期的年，月，日，星期，时,分,秒信息
 */
+ (NSDateComponents *) getDateInfoWithDate:(NSDate *)date;

@end
