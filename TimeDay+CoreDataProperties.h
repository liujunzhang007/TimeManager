//
//  TimeDay+CoreDataProperties.h
//  
//
//  Created by TourWay_iOS on 13/04/2017.
//
//  This file was automatically generated and should not be edited.
//

#import "TimeDay+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TimeDay (CoreDataProperties)

+ (NSFetchRequest<TimeDay *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *color;
@property (nullable, nonatomic, retain) NSObject *dataArray;
@property (nullable, nonatomic, copy) NSString *dateString;
@property (nullable, nonatomic, copy) NSString *detailText;
@property (nonatomic) int32_t item;
@property (nullable, nonatomic, retain) NSObject *others;
@property (nonatomic) int32_t section;
@property (nullable, nonatomic, copy) NSString *textTitle;
@property (nonatomic) int32_t timeMouth;
@property (nonatomic) int32_t timeWeekofMouth;
@property (nonatomic) int32_t timeWeekofYear;
@property (nonatomic) int32_t timeYear;
@property (nonatomic) int32_t typeId;
@property (nonatomic) int32_t typeString;

@end

NS_ASSUME_NONNULL_END
