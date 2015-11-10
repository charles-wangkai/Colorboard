//
//  ColorViewController.h
//  Colorboard
//
//  Created by WangKai on 11/10/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorDescription.h"

@interface ColorViewController : UIViewController

@property (nonatomic) BOOL existingColor;
@property (nonatomic) ColorDescription *colorDescription;

@end
