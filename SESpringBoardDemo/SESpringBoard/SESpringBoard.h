//
//  SESpringBoard.h
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Sarp Erdag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEMenuItem.h"

@interface SESpringBoard : UIView <MenuItemDelegate> {
    UIView *topBar;
    UINavigationController *nav;
} 

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIImage *launcher;
@property (nonatomic, retain) NSMutableArray *items;

+ (id) initWithTitle:(NSString *)boardTitle items:(NSMutableArray *)menuItems launcherImage:(UIImage *)image;

@end
