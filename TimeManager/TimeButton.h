//
//  TimeButton.h
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeButton : UIButton

@property (nonatomic ,strong) NSString *text;

@property (nonatomic ,assign) NSInteger section;
@property (nonatomic ,assign) NSInteger item;

@end
