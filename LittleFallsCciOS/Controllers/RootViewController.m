//
//  RootViewController.m
//  REMenuExample
//
//  Created by Roman Efimov on 2/20/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "ExploreViewController.h"
#import "ActivityViewController.h"
#import "ProfileViewController.h"
#import "NavigationViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    
    // Here self.navigationController is an instance of NavigationViewController (which is a root controller for the main window)
    //
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(toggleMenu)];
    
    UIImage *navigationBarImage =  [self imageWithImage:[UIImage imageNamed:@"NavigationBarButton.png"] scaledToSize:CGSizeMake(25, 50)];
    [navigationBarImage drawInRect:CGRectMake( 0, 0, 25, 50)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:navigationBarImage style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(toggleMenu)];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.image = [UIImage imageNamed:@"Balloon"];
//    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:imageView];
    
    // Demo label to show current controller class
    //
//    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
//    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    label.text = NSStringFromClass(self.class);
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont boldSystemFontOfSize:21];
//    label.backgroundColor  = [UIColor clearColor];
//    [self.view addSubview:label];
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

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NavigationViewController *navigationController = (NavigationViewController *)self.navigationController;
    [navigationController.menu setNeedsLayout];
}

#pragma mark -
#pragma mark Rotation

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
