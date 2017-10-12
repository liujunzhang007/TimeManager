//
//  TimeModel.h
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeModel : NSObject

@property (nonatomic ,strong) NSMutableArray *DataArray;

@property (nonatomic ,assign) NSInteger section;
@property (nonatomic ,assign) NSInteger item;

@property (nonatomic ,strong) NSString *textTitle;
@property (nonatomic ,strong) UIColor *color;



@property (nonatomic ,assign) NSInteger timeYear;
@property (nonatomic ,assign) NSInteger timeMouth;
@property (nonatomic ,assign) NSInteger timeWeekofYear;
@property (nonatomic ,assign) NSInteger timeWeekofMouth;

@property (nonatomic ,strong) NSString *detailText;
@property (nonatomic ,strong) NSString *dateString;
@property (nonatomic ,assign) NSInteger typeId;
@property (nonatomic ,strong) NSString *typeString;

@property (nonatomic ,strong) NSMutableDictionary *Others;

@end
