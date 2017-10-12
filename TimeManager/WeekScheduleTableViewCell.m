//
//  WeekScheduleTableViewCell.m
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import "WeekScheduleTableViewCell.h"
#import "NSDate+Calendar.h"
#import <objc/runtime.h>
#define ButtonAlpha 0.5

@implementation WeekScheduleTableViewCell
{
    UIView *_bottomView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}
- (void)configUI{
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 75*34, 100)];
    [self.contentView addSubview:_bottomView];
}
- (void)setDataWithModel:(TimeModel *)model{
    CGFloat buttom_x = 0.0;
    if (_bottomView!=nil) {
        [_bottomView removeFromSuperview];
        _bottomView = nil;
    }
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 75*34, 100)];
    
    TimeButton *weekButton = [TimeButton buttonWithType:UIButtonTypeCustom];
    weekButton.frame = CGRectMake(0, 0, 75, 100);
//    weekButton.backgroundColor = [UIColor colorTransferToRGB:@"#a1d7f4"];
    weekButton.backgroundColor = [UIColor colorTransferToRGB:@"#fffbe4"];
    weekButton.titleLabel.font = [UIFont systemFontOfSize:16];
    weekButton.titleLabel.numberOfLines = 0;
    weekButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    weekButton.alpha = 0.8;
    weekButton.layer.borderColor = [UIColor colorTransferToRGB:@"#eeeeee"].CGColor;
    weekButton.layer.borderWidth = 1;
    [weekButton setTitleColor:[UIColor colorTransferToRGB:@"#333333"] forState:UIControlStateNormal];
    TimeModel *firstModel = model.DataArray.firstObject;
    switch (firstModel.section) {
        case 0:
            [weekButton setTitle:@"星期一" forState:UIControlStateNormal];
            break;
        case 1:
            [weekButton setTitle:@"星期二" forState:UIControlStateNormal];
            break;
        case 2:
            [weekButton setTitle:@"星期三" forState:UIControlStateNormal];
            break;
        case 3:
            [weekButton setTitle:@"星期四" forState:UIControlStateNormal];
            break;
        case 4:
            [weekButton setTitle:@"星期五" forState:UIControlStateNormal];
            break;
        case 5:
            [weekButton setTitle:@"星期六" forState:UIControlStateNormal];
            break;
        case 6:
            [weekButton setTitle:@"星期天" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    [_bottomView addSubview:weekButton];
    buttom_x+=75+1;
    
    NSDateComponents *comps = [NSDate getDateInfoWithDate:[NSDate date]];
    if (comps.weekday == 0) {
        if (firstModel.section == 6) {
            weekButton.layer.borderColor = [UIColor redColor].CGColor;
            weekButton.layer.borderWidth = 2;
            NSString *buttontext = weekButton.titleLabel.text;
            [weekButton setTitle:[NSString stringWithFormat:@"今天"] forState:UIControlStateNormal];
        }else{
            weekButton.layer.borderColor = [UIColor clearColor].CGColor;
            weekButton.layer.borderWidth = 0;
        }
    }else{
        if (firstModel.section == comps.weekday - 2) {
            weekButton.layer.borderColor = [UIColor redColor].CGColor;
            weekButton.layer.borderWidth = 2;
            NSString *buttontext = weekButton.titleLabel.text;
            [weekButton setTitle:[NSString stringWithFormat:@"今天"] forState:UIControlStateNormal];
        }else{
            weekButton.layer.borderColor = [UIColor clearColor].CGColor;
            weekButton.layer.borderWidth = 0;
        }
    }

    [self.contentView addSubview:_bottomView];
    for (TimeModel *subModel in model.DataArray) {
        TimeButton *button = [TimeButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttom_x, 0, 75, 100);
        button.layer.cornerRadius = 7;
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor colorTransferToRGB:@"#eeeeee"].CGColor;
        [button setTitle:subModel.textTitle forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorTransferToRGB:@"#33333"] forState:UIControlStateNormal];
        button.text = subModel.textTitle;
        button.section = subModel.section;
        button.item = subModel.item;
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(TimeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        buttom_x+=75;
        
        UIView *backView = [[UIView alloc]initWithFrame:button.frame];
        backView.backgroundColor = [UIColor whiteColor];
        backView.layer.cornerRadius = 7;
        if (subModel.color != nil) {
            backView.backgroundColor = subModel.color;
        }
        backView.alpha = ButtonAlpha;
        [_bottomView addSubview:backView];
        
        [_bottomView addSubview:button];
    }
    _bottomView.frame = CGRectMake(0, 0, buttom_x+75+1, 100);
}

- (void)TimeButtonAction:(TimeButton *)button{
    if (_TimeButtonBlock) {
        _TimeButtonBlock(button.text);
    }
}
- (void)setTimeButtonBlock:(void (^)(NSString *))TimeButtonBlock{
    _TimeButtonBlock = TimeButtonBlock;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
