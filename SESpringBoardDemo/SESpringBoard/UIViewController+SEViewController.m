//
//  UIViewController+SEViewController.m
//  SESpringBoardDemo
//
//  Created by jac on 7/26/12.
//
//

#import "UIViewController+SEViewController.h"

@implementation UIViewController (SEViewController)


- (void)quitView: (id) sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeView" object:self.navigationController.view];
}

-(void) setupCloseButtonWithImage:(UIImage *) closeImage {
    // add a button to the navigation bar to switch back to the springboard interface (home)
    UIButton *btn = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    [btn setBackgroundImage: closeImage forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 0, 41, 33)];
    [btn addTarget:self action:@selector(quitView:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *showLauncher = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = showLauncher;
    
}
@end
