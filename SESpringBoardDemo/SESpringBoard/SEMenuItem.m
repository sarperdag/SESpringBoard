//
//  SEMenuItem.m
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Sarp Erdag. All rights reserved.
//

#import "SEMenuItem.h"
#import "SESpringBoard.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>

@implementation SEMenuItem

@synthesize tag, delegate, isRemovable, isInEditingMode;

#pragma mark - UI actions

- (void) clickItem:(id) sender {
    UIButton *theButton = (UIButton *) sender;
    [[self delegate] launch:theButton.tag :vcToLoad];
}

- (void) pressedLong:(id) sender {
    [self enableEditing];
}

- (void) removeButtonClicked:(id) sender  {
    [[self delegate] removeFromSpringboard:tag];
}

#pragma mark - Custom Methods

- (void) enableEditing {

    if (self.isInEditingMode == YES)
        return;
    
    // put item in editing mode
    self.isInEditingMode = YES;
    
    // make the remove button visible
    [removeButton setHidden:NO];
    
    // start the wiggling animation
    CATransform3D transform;
    
    if (arc4random() % 2 == 1)
        transform = CATransform3DMakeRotation(-0.08, 0, 0, 1.0);  
    else
        transform = CATransform3DMakeRotation(0.08, 0, 0, 1.0);  
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];  
    animation.toValue = [NSValue valueWithCATransform3D:transform];  
    animation.autoreverses = YES;   
    animation.duration = 0.1;   
    animation.repeatCount = 10000;   
    animation.delegate = self;  
    [[self layer] addAnimation:animation forKey:@"wiggleAnimation"];
    
    // inform the springboard that the menu items are now editable so that the springboard
    // will place a done button on the navigationbar 
    [(SESpringBoard *)self.delegate enableEditingMode];
    
}

- (void) disableEditing {
    [[self layer] removeAllAnimations];
    [removeButton setHidden:YES];
    self.isInEditingMode = NO;
}

- (void) updateTag:(int) newTag {
    self.tag = newTag;
    removeButton.tag = newTag;
}

#pragma mark - Initialization

- (id) initWithTitle:(NSString *)title :(NSString *)imageName :(UIViewController *)viewController :(BOOL)removable {
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        vcToLoad = viewController;
        image = imageName;
        titleText = title;
        self.isInEditingMode = NO;
        self.isRemovable = removable;
    }
    return self;
}

+ (id) initWithTitle:(NSString *)title imageName:(NSString *)imageName viewController:(UIViewController *)viewController removable:(BOOL)removable  {
	SEMenuItem *tmpInstance = [[[SEMenuItem alloc] initWithTitle:title :imageName :viewController :removable] autorelease];
	return tmpInstance;
}

# pragma mark - Overriding UiView Methods

- (void) removeFromSuperview {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0;
        [self setFrame:CGRectMake(self.frame.origin.x+50, self.frame.origin.y+50, 0, 0)];
        [removeButton setFrame:CGRectMake(0, 0, 0, 0)];
    }completion:^(BOOL finished) {
        [super removeFromSuperview];
    }]; 
}

# pragma mark - Drawing

- (void) drawRect:(CGRect)rect {    
    // draw the icon image
    UIImage* img = [UIImage imageNamed:image];
    [img drawInRect:CGRectMake(20.0, 10.0, 60, 60)];
    
    // draw the menu item title shadow
    NSString* shadowText = titleText;
    [[UIColor blackColor] set];
    UIFont *bold14 = [UIFont fontWithName:@"Helvetica-Bold" size:14];
	[shadowText drawInRect:CGRectMake(0.0, 72.0, 100, 20.0) withFont:bold14 lineBreakMode:UILineBreakModeTailTruncation alignment:UITextAlignmentCenter];
    
    // draw the menu item title
    NSString* text = titleText;
    [[UIColor whiteColor] set];
	[text drawInRect:CGRectMake(0.0, 70.0, 100, 20.0) withFont:bold14 lineBreakMode:UILineBreakModeTailTruncation alignment:UITextAlignmentCenter];
    
    // place a clickable button on top of everything
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 100, 110)];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressedLong:)];
    [button addGestureRecognizer:longPress];
    [longPress release];
    [self addSubview:button];
    
    if (self.isRemovable) {
        // place a remove button on top right corner for removing item from the board
        removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeButton setFrame:CGRectMake(65, 5, 20, 20)];
        [removeButton setImage:[UIImage imageNamed:@"btn_delete.png"] forState:UIControlStateNormal];
        removeButton.backgroundColor = [UIColor clearColor];
        [removeButton addTarget:self action:@selector(removeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        removeButton.tag = tag;
        [removeButton setHidden:YES];
        [self addSubview:removeButton];
    }
}


@end
