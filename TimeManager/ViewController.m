//
//  ViewController.m
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.获取系统interactivePopGestureRecognizer对象的target对象
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    
    //2.创建滑动手势，taregt设置interactivePopGestureRecognizer的target，所以当界面滑动的时候就会自动调用target的action方法。
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    pan.delegate = self;
    
    //3.添加到导航控制器的视图上
    [self.navigationController.view addGestureRecognizer:pan];
    
    //4.禁用系统的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
//    //  这句很核心 稍后讲解
//    id target = self.interactivePopGestureRecognizer.delegate;
//    //  这句很核心 稍后讲解
//    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
//    //  获取添加系统边缘触发手势的View
//    UIView *targetView = self.interactivePopGestureRecognizer.view;
//    
//    //  创建pan手势 作用范围是全屏
//    UIPanGestureRecognizer * fullScreenGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:handler];
//    fullScreenGes.delegate = self;
//    [targetView addGestureRecognizer:fullScreenGes];
//    
//    // 关闭边缘触发手势 防止和原有边缘手势冲突
//    [self.interactivePopGestureRecognizer setEnabled:NO];
}
#pragma mark - 滑动开始触发事件
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    return self.childViewControllers.count == 1 ? NO : YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
