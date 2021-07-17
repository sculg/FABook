//
//  AppDelegate.m
//  FABook
//
//  Created by lg on 2021/7/14.
//

#import "AppDelegate.h"
#import "AppDelegate+CYLTabBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 调用分类文件中的配置主窗口方法：
    [self configureForTabBarController];
    
    return YES;
}


@end
