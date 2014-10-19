//
//  AppDelegate.m
//  REMenuExample
//
//  Created by Roman Efimov on 2/20/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.window.rootViewController = [[NavigationViewController alloc] initWithRootViewController:[[RPViewController alloc] initWithCollectionViewLayout:flowLayout]];
    

    
//    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [UIApplication sharedApplication].statusBarHidden = YES;
    return YES;
}

@end

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    //    RPSlidingMenuLayout* flowLayout = [[RPSlidingMenuLayout alloc]init];
//    //    RPViewController *rPViewController = [[RPViewController alloc]initWithCollectionViewLayout:flowLayout];
//    //    self.window.rootViewController = rPViewController;
//    self.window.rootViewController = [[NavigationViewController alloc] initWithRootViewController:[[HomeViewController alloc] initWithCollectionViewLayout:flowLayout]];
//    
//    //    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    [UIApplication sharedApplication].statusBarHidden = YES;
//    return YES;
//}
//
//@end
