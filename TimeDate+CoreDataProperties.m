//
//  TimeDate+CoreDataProperties.m
//  
//
//  Created by TourWay_iOS on 13/04/2017.
//
//  This file was automatically generated and should not be edited.
//

#import "TimeDate+CoreDataProperties.h"

@implementation TimeDate (CoreDataProperties)

+ (NSFetchRequest<TimeDate *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TimeDate"];
}

@dynamic dataArray;
@dynamic section;
@dynamic item;
@dynamic textTitle;
@dynamic color;
@dynamic timeYear;
@dynamic timeMouth;
@dynamic timeWeekofYear;
@dynamic timeWeekofMouth;
@dynamic detailText;
@dynamic dateString;
@dynamic typeId;
@dynamic typeString;
@dynamic others;

@end
