//
//  ViewController.m
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Sarp Erdag. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"
#import "SESpringBoard.h"


@implementation ViewController

@synthesize vc1, vc2;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    vc1 = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
    vc2 = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
    // create or reference more view controllers here
	// ...
    
    
    // create an array of SEMenuItem objects
    NSMutableArray *items = [NSMutableArray array];
    [items addObject:[SEMenuItem initWithTitle:@"facebook" imageName:@"facebook.png" viewController:vc1]];
    [items addObject:[SEMenuItem initWithTitle:@"twitter" imageName:@"twitter.png" viewController:vc2]];
    [items addObject:[SEMenuItem initWithTitle:@"youtube" imageName:@"youtube.png" viewController:vc1]];
    [items addObject:[SEMenuItem initWithTitle:@"linkedin" imageName:@"linkedin.png" viewController:vc2]];
    [items addObject:[SEMenuItem initWithTitle:@"rss" imageName:@"rss.png" viewController:vc1]];
    [items addObject:[SEMenuItem initWithTitle:@"google" imageName:@"google.png" viewController:vc2]];
    [items addObject:[SEMenuItem initWithTitle:@"stumbleupon" imageName:@"su.png" viewController:vc2]];
    [items addObject:[SEMenuItem initWithTitle:@"digg" imageName:@"digg.png" viewController:vc2]];
    [items addObject:[SEMenuItem initWithTitle:@"technorati" imageName:@"technorati.png" viewController:vc2]];
    
    // pass the array to a newly created SESpringBoard and add it to your view
    SESpringBoard *board = [SESpringBoard initWithTitle:@"Welcome" items:items launcherImage:[UIImage imageNamed:@"navbtn_home.png"]];
    [self.view addSubview:board];
}

@end
