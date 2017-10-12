//
//  TimeDate+CoreDataProperties.h
//  
//
//  Created by TourWay_iOS on 13/04/2017.
//
//  This file was automatically generated and should not be edited.
//

#import "TimeDate+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TimeDate (CoreDataProperties)

+ (NSFetchRequest<TimeDate *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSObject *dataArray;
@property (nonatomic) int32_t section;
@property (nonatomic) int32_t item;
@property (nullable, nonatomic, copy) NSString *textTitle;
@property (nullable, nonatomic, copy) NSString *color;
@property (nonatomic) int32_t timeYear;
@property (nonatomic) int32_t timeMouth;
@property (nonatomic) int32_t timeWeekofYear;
@property (nonatomic) int32_t timeWeekofMouth;
@property (nullable, nonatomic, copy) NSString *detailText;
@property (nullable, nonatomic, copy) NSString *dateString;
@property (nonatomic) int32_t typeId;
@property (nonatomic) int32_t typeString;
@property (nullable, nonatomic, retain) NSObject *others;

@end

NS_ASSUME_NONNULL_END
