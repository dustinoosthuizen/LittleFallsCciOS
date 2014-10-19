//
//  PaddedUILabel.m
//  REMenuExample
//
//  Created by Dustin Oosthuizen on 2014/10/13.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "PaddedUILabel.h"

@interface PaddedUILabel ()

@end

@implementation PaddedUILabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 50, 0, 50};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
