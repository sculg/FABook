//
//  AppDelegate+CYLTabBar.m
//  FABook
//
//  Created by lg on 2021/7/17.
//

#import "AppDelegate+CYLTabBar.h"
#import "CYLTabBarController.h"

#import "FABAccountingVC.h"
#import "FABReportFormVC.h"
#import "FABMyVC.h"

@implementation AppDelegate (CYLTabBar)

- (void)configureForTabBarController {
    // 设置主窗口，并设置根视图控制器
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // 初始化 CYLTabBarController 对象
    CYLTabBarController *tabBarController =
    [CYLTabBarController tabBarControllerWithViewControllers:[self viewControllers]
                                       tabBarItemsAttributes:[self tabBarItemsAttributes]];
    [self customizeInterface];

    // 将 CYLTabBarController 设置为 window 的 RootViewController
    self.window.rootViewController = tabBarController;
}

- (NSArray *)viewControllers {
    FABAccountingVC *firstViewController = [[FABAccountingVC alloc] init];
    firstViewController.navigationItem.title = @"记账";
    CYLBaseNavigationController *firstNavigationController = [[CYLBaseNavigationController alloc]
                                                              initWithRootViewController:firstViewController];
    [firstViewController cyl_setHideNavigationBarSeparator:YES];
    
    FABReportFormVC *secondViewController = [[FABReportFormVC alloc] init];
    secondViewController.navigationItem.title = @"报表";
    CYLBaseNavigationController *secondNavigationController = [[CYLBaseNavigationController alloc]
                                                               initWithRootViewController:secondViewController];
    [secondViewController cyl_setHideNavigationBarSeparator:YES];
    
    FABMyVC *thirdViewController = [[FABMyVC alloc] init];
    thirdViewController.navigationItem.title = @"我的";
    CYLBaseNavigationController *thirdNavigationController = [[CYLBaseNavigationController alloc]
                                                              initWithRootViewController:thirdViewController];
    [thirdViewController cyl_setHideNavigationBarSeparator:YES];
    
    NSArray *viewControllers = @[
        firstNavigationController,
        secondNavigationController,
        thirdNavigationController,
    ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributes {
    NSDictionary *firstTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"记账",
        CYLTabBarItemImage : @"tabbar_item_accounting_normal",  /* NSString and UIImage are supported*/
        CYLTabBarItemSelectedImage : @"tabbar_item_accounting_selected",  /* NSString and UIImage are supported*/
    };
    NSDictionary *secondTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"报表",
        CYLTabBarItemImage : @"tabbar_item_reportform_normal",
        CYLTabBarItemSelectedImage : @"tabbar_item_reportform_selected",
    };
    
    NSDictionary *thirdTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"我的",
        CYLTabBarItemImage : @"tabbar_item_mysetting_normal",
        CYLTabBarItemSelectedImage : @"tabbar_item_mysetting_selected",
    };
    NSArray *tabBarItemsAttributes = @[
        firstTabBarItemsAttributes,
        secondTabBarItemsAttributes,
        thirdTabBarItemsAttributes,
    ];
    return tabBarItemsAttributes;
}

- (void)customizeInterface {
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
}

@end
