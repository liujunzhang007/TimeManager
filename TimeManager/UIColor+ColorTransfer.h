//
//  UIColor+ColorTransfer.h
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorTransfer)
/**
 *将16进制色值转换成为RGB色值,直接返回给UIColer,例如[UIColor colorTransferToRGB:@"#ffffff"];
 */
+ (UIColor *)colorTransferToRGB:(NSString *)color;

@end
