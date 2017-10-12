//
//  TabBarController.m
//  TimeManager
//
//  Created by TourWay_iOS on 12/04/2017.
//  Copyright © 2017 TourWay_iOS. All rights reserved.
//

#import "TabBarController.h"
#import "MainPageViewController.h"
#import "SettingViewController.h"


@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MainPageViewController *mainPage = [[MainPageViewController alloc]init];
    mainPage.title = @"主页";
    mainPage.tabBarItem.title = @"主页";
    mainPage.tabBarItem.image = [UIImage imageNamed:alarm];
    UINavigationController *mainPageNav = [[UINavigationController alloc]initWithRootViewController:mainPage];
    
    SettingViewController *settingPage = [[SettingViewController alloc]init];
    settingPage.title = @"设置";
    settingPage.tabBarItem.title = @"设置";
    settingPage.tabBarItem.image = [UIImage imageNamed:setting];
    UINavigationController *settingPageNav = [[UINavigationController alloc]initWithRootViewController:settingPage];

//    [[UITabBar appearance] setBarTintColor:[UIColor colorTransferToRGB:@"#fffbe4"]];
    
    self.viewControllers = @[mainPageNav,settingPageNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
