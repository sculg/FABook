//
//  AppDelegate+CYLTabBar.h
//  FABook
//
//  Created by lg on 2021/7/17.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (CYLTabBar)<UITabBarControllerDelegate>

/// 配置主窗口
- (void)configureForTabBarController;

@end

NS_ASSUME_NONNULL_END
