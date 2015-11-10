//
//  ColorDescription.m
//  Colorboard
//
//  Created by WangKai on 11/10/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "ColorDescription.h"

@implementation ColorDescription

- (instancetype)init {
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
