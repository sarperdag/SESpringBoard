//
//  SEViewController.m
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Apperto. All rights reserved.
//

#import "SEViewController.h"

@implementation SEViewController

@synthesize launcherImage;


- (void)quitView: (id) sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeView" object:self.navigationController.view];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // add a button to the navigation bar to switch back to the springboard interface (home)
    UIButton *btn = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    [btn setBackgroundImage:launcherImage forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 0, 41, 33)];
    [btn addTarget:self action:@selector(quitView:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *showLauncher = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = showLauncher;
    [showLauncher release];
}

- (void)dealloc {
    [super dealloc];
}


@end
