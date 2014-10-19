//
//  ProfileViewController.m
//  REMenuExample
//
//  Created by Roman Efimov on 4/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

//UIScrollView *_mainScrollView;

- (void)viewDidLoad
{
//    self.title = @"Profile";
    
    [super viewDidLoad];
//    UIImage *image = [UIImage imageNamed:@"Balloon"];
//    
//    UIImageView *aImageView = [[UIImageView alloc] initWithImage:image];
//    
//    [self.view addSubview:aImageView];
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.frame];
    [self.view addSubview:mainScrollView];
}

@end
