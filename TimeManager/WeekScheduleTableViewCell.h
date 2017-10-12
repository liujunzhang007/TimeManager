//
//  WeekScheduleTableViewCell.h
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeButton.h"
#import "TimeModel.h"

@interface WeekScheduleTableViewCell : UITableViewCell

@property (nonatomic ,strong) void (^TimeButtonBlock)(NSString *text);

- (void)setDataWithModel:(TimeModel *)model;

- (void)setTimeButtonBlock:(void (^)(NSString *))TimeButtonBlock;

@end
