//
//  SEMenuItem.m
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Sarp Erdag. All rights reserved.
//

#import "SEMenuItem.h"

@implementation SEMenuItem

@synthesize tag, delegate;

-(void)clickItem:(id) sender {
    UIButton *theButton = (UIButton *) sender;
    [[self delegate] launch:theButton.tag :vcToLoad];
}

- (id) initWithTitle:(NSString *)title :(NSString *)imageName :(UIViewController *)viewController{
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        vcToLoad = viewController;
        image = imageName;
        titleText = title;
    }
    return self;
}

+ (id) initWithTitle:(NSString *)title imageName:(NSString *)imageName viewController:(UIViewController *)viewController
{
	SEMenuItem *tmpInstance = [[[SEMenuItem alloc] initWithTitle:title :imageName :viewController] autorelease];
	return tmpInstance;
}


- (void)drawRect:(CGRect)rect
{    
    // draw the icon image
    UIImage* img = [UIImage imageNamed:image];
    [img drawInRect:CGRectMake(20.0, 10.0, 60, 60)];
    
    // draw the menu item title shadow
    NSString* shadowText = titleText;
    [[UIColor blackColor] set];
    UIFont *bold14 = [UIFont fontWithName:@"Helvetica-Bold" size:14];
	[shadowText drawInRect:CGRectMake(0.0, 77.0, 100, 20.0) withFont:bold14 lineBreakMode:UILineBreakModeTailTruncation alignment:UITextAlignmentCenter];
    
    // draw the menu item title
    NSString* text = titleText;
    [[UIColor whiteColor] set];
	[text drawInRect:CGRectMake(0.0, 75.0, 100, 20.0) withFont:bold14 lineBreakMode:UILineBreakModeTailTruncation alignment:UITextAlignmentCenter];
    
    // place a clickable button on top of everything
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 100, 110)];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    [self addSubview:button];
}


@end
