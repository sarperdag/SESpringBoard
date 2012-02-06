//
//  ChildViewController.m
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Sarp Erdag. All rights reserved.
//

#import "ChildViewController.h"

@implementation ChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    // place any dynamic stuff you want to initialize in the child view here
    
    UIBarButtonItem *buttonItemDoSomething = [[[ UIBarButtonItem alloc ] initWithTitle: @"DoSomething" style: UIBarButtonItemStyleBordered target:self action: @selector(onCreate:) ] autorelease];
    
    NSArray *toolBarItems = [[[NSArray alloc] initWithObjects:buttonItemDoSomething, nil] autorelease];
    
    [self.navigationController setToolbarHidden:NO];
    
    self.toolbarItems = toolBarItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
