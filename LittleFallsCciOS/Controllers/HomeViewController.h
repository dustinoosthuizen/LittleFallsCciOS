//
//  HomeViewController.h
//  REMenuExample
//
//  Created by Roman Efimov on 4/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "RPViewController.h"

@interface HomeViewController : RootViewController
@property (strong, readwrite, nonatomic) RPViewController *rpViewController;
@end
