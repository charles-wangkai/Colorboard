//
//  PaletteViewController.m
//  Colorboard
//
//  Created by WangKai on 11/10/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "PaletteViewController.h"
#import "ColorViewController.h"
#import "ColorDescription.h"

@interface PaletteViewController ()

@property (nonatomic) NSMutableArray *colors;

@end

@implementation PaletteViewController

- (NSMutableArray *)colors {
    if (!_colors) {
        _colors = [NSMutableArray array];
        
        ColorDescription *cd = [[ColorDescription alloc] init];
        [_colors addObject:cd];
    }
    return _colors;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    ColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        // If we are adding a new color, create an instance
        // and add it to the colors array
        ColorDescription *color = [[ColorDescription alloc] init];
        [self.colors addObject:color];
        
        // Then use the segue to set the color on the view controller
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        ColorViewController *mvc = (ColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
    } else if ([segue.identifier isEqualToString:@"ExistingColor"]) {
        // For the push segue, the sender is the UITableViewCell
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        ColorDescription *color = self.colors[ip.row];
        
        // Set the color, and also tell the view controller that this
        // is an existing color
        ColorViewController *cvc = (ColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}

@end
