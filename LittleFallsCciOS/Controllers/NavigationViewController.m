//
//  NavigationViewController.m
//  REMenuExample
//
//  Created by Roman Efimov on 4/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//
//  Sample icons from http://icons8.com/download-free-icons-for-ios-tab-bar
//

#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "ExploreViewController.h"
#import "ActivityViewController.h"
#import "ProfileViewController.h"
#import "RPViewController.h"
#import "CollectionViewController.h"
#import "MenuExpandingViewController.h"


@interface NavigationViewController () <REMenuDelegate>

@property (strong, readwrite, nonatomic) REMenu *menu;

@end

@implementation NavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *backgroundImage1 = [UIImage imageNamed:@"NavigatioBar.png"];
    UIImage *backgroundImage =  [self imageWithImage:backgroundImage1 scaledToSize:CGSizeMake(320, 44)];
    [self.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
   
    if (REUIKitIsFlatMode()) {
        [self.navigationBar performSelector:@selector(setBarTintColor:) withObject:[UIColor colorWithRed:0/255.0 green:213/255.0 blue:161/255.0 alpha:1]];
        self.navigationBar.tintColor = [UIColor whiteColor];
    } else {
        self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    }
    
    __typeof (self) __weak weakSelf = self;
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"HOME"
                                                    //subtitle:@""
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                          
                                                          UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
                                                          RPViewController *controller = [[RPViewController alloc] initWithCollectionViewLayout:flowLayout];
                                                          [weakSelf setViewControllers:@[controller] animated:NO];
                                                          controller.navigationItem.backBarButtonItem.title = @"";
                                                      }];
    
    REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"EXPLORE"
                                                       //subtitle:@""
                                                          image:[UIImage imageNamed:@"Icon_Explore"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
                                                             ExploreViewController *controller = [[ExploreViewController alloc] initWithCollectionViewLayout:flowLayout];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"ACTIVITY"
                                                        //subtitle:@""
                                                           image:[UIImage imageNamed:@"Icon_Activity"]
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              NSLog(@"Item: %@", item);
                                                              UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
                                                              ActivityViewController *controller = [[ActivityViewController alloc] initWithCollectionViewLayout:flowLayout];
                                                              [weakSelf setViewControllers:@[controller] animated:NO];
                                                          }];
    
//    activityItem.badge = @"12";
    
    REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"PROFILE"
                                                          image:[UIImage imageNamed:@"Icon_Profile"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
                                                             ProfileViewController *controller = [[ProfileViewController alloc] initWithCollectionViewLayout:flowLayout];
                                                             [weakSelf pushViewController:controller animated:NO];
                                                             //[weakSelf setViewControllers:@[controller] animated:NO];
//                                                             controller.navigationItem.backBarButtonItem.title = @"";
                                                         }];
    
    // You can also assign a custom view for any particular item
    // Uncomment the code below and add `customViewItem` to `initWithItems` array, for example:
    // self.menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem, customViewItem]]
    //
    /*
    UIView *customView = [[UIView alloc] init];
    customView.backgroundColor = [UIColor blueColor];
    customView.alpha = 0.4;
    REMenuItem *customViewItem = [[REMenuItem alloc] initWithCustomView:customView action:^(REMenuItem *item) {
        NSLog(@"Tap on customView");
    }];
    */
    
    homeItem.tag = 0;
    exploreItem.tag = 1;
    activityItem.tag = 2;
    profileItem.tag = 3;
    
    self.menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem]];
    
    // Background view
    //
    //self.menu.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    //self.menu.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //self.menu.backgroundView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.600];

//    self.menu.imageAlignment = REMenuImageAlignmentRight;
    //self.menu.closeOnSelection = NO;
    self.menu.appearsBehindNavigationBar = NO; // Affects only iOS 7
    if (!REUIKitIsFlatMode()) {
        self.menu.cornerRadius = 4;
        self.menu.shadowRadius = 4;
        self.menu.shadowColor = [UIColor blackColor];
        self.menu.shadowOffset = CGSizeMake(0, 1);
        self.menu.shadowOpacity = 1;
    }
    
    // Blurred background in iOS 7
    //
    //self.menu.liveBlur = YES;
    //self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;

    self.menu.separatorOffset = CGSizeMake(15.0, 0.0);

    self.menu.imageOffset = CGSizeMake(5, -1);
    self.menu.waitUntilAnimationIsComplete = NO;
//    self.menu.badgeLabelConfigurationBlock = ^(UILabel *badgeLabel, REMenuItem *item) {
//        badgeLabel.backgroundColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
//        badgeLabel.layer.borderColor = [UIColor colorWithRed:0.000 green:0.648 blue:0.507 alpha:1.000].CGColor;
//    };
    self.menu.delegate = self;
    
    
    [self.menu setClosePreparationBlock:^{
        NSLog(@"Menu will close");
    }];
    
    [self.menu setCloseCompletionHandler:^{
        NSLog(@"Menu did close");
    }];
    
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)toggleMenu
{
    if (self.menu.isOpen)
        return [self.menu close];
    
    [self.menu showFromNavigationController:self];
}

#pragma mark - REMenu Delegate Methods

-(void)willOpenMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

-(void)didOpenMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

-(void)willCloseMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

-(void)didCloseMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

@end
