//
//  ChildViewController.m
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Sarp Erdag. All rights reserved.
//

#import "ChildViewController.h"

@implementation ChildViewController


#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    // place any dynamic stuff you want to initialize in the child view here
    
    UIBarButtonItem *buttonItemDoSomething = [[[ UIBarButtonItem alloc ] initWithTitle: @"DoSomething" style: UIBarButtonItemStyleBordered target:self action: nil ] autorelease];
    
    NSArray *toolBarItems = [[[NSArray alloc] initWithObjects:buttonItemDoSomething, nil] autorelease];
    
    [self.navigationController setToolbarHidden:NO];
    
    self.toolbarItems = toolBarItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

@end
