//
//  SESpringBoard.m
//  SESpringBoardDemo
//
//  Created by Sarp Erdag on 11/5/11.
//  Copyright (c) 2011 Apperto. All rights reserved.
//

#import "SESpringBoard.h"
#import "SEViewController.h"

@implementation SESpringBoard

@synthesize items, title, launcher;

- (id) initWithTitle:(NSString *)boardTitle items:(NSMutableArray *)menuItems image:(UIImage *) image{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self setUserInteractionEnabled:YES];
    if (self) {
        self.launcher = image;
        
        // create the top bar
        self.title = boardTitle;
        topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = UITextAlignmentCenter;
        [titleLabel setText:title];
        [topBar addSubview:titleLabel];
        topBar.backgroundColor = [UIColor blackColor];
        [self addSubview:topBar];
        
        // create a container view to put the menu items inside
        UIView *itemsContainer = [[UIView alloc] initWithFrame:CGRectMake(10, 60, 300, 416)];
        [self addSubview:itemsContainer];
        
        self.items = menuItems;
        int counter = 0;
        int horgap = 0;
        int vergap = 0;
        for (SEMenuItem *item in self.items) {
            item.tag = counter;
            item.delegate = self;
            [item setFrame:CGRectMake(item.frame.origin.x + horgap, item.frame.origin.y + vergap, 100, 100)];
            [itemsContainer addSubview:item];
            horgap = horgap + 100;
            counter = counter + 1;
            if(counter % 3 == 0){
                vergap = vergap + 100;
                horgap = 0;
            }
        }
        
        [itemsContainer release];
        
        // add listener to detect close view events
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(closeViewEventHandler:)
         name:@"closeView"
         object:nil ];
    }
    return self;
}

+ (id) initWithTitle:(NSString *)boardTitle items:(NSMutableArray *)menuItems launcherImage:(UIImage *)image {
    SESpringBoard *tmpInstance = [[[SESpringBoard alloc] initWithTitle:boardTitle items:menuItems image:image] autorelease];
	return tmpInstance;
};

- (void)dealloc {
    [items release];
    [launcher release];
    [topBar release];
    [super dealloc];
}

// transition animation function required for the springboard look & feel
- (CGAffineTransform)offscreenQuadrantTransformForView:(UIView *)theView {
    CGPoint parentMidpoint = CGPointMake(CGRectGetMidX(theView.superview.bounds), CGRectGetMidY(theView.superview.bounds));
    CGFloat xSign = (theView.center.x < parentMidpoint.x) ? -1.f : 1.f;
    CGFloat ySign = (theView.center.y < parentMidpoint.y) ? -1.f : 1.f;
    return CGAffineTransformMakeTranslation(xSign * parentMidpoint.x, ySign * parentMidpoint.y);
}

- (void)launch:(int)tag :viewController{
    // create a navigation bar
    nav = [UINavigationController alloc];
    SEViewController *vc = viewController;
    vc.launcherImage = launcher;
    [nav initWithRootViewController:viewController];
    
    nav.view.alpha = 0.f;
    nav.view.transform = CGAffineTransformMakeScale(.1f, .1f);
    [self addSubview:nav.view];
    
    [UIView animateWithDuration:.3f  animations:^{
        // fade out the buttons
        for(SEMenuItem *item in self.items) {
            item.transform = [self offscreenQuadrantTransformForView:item];
            item.alpha = 0.f;
        }
        
        // fade in the selected view
        nav.view.alpha = 1.f;
        nav.view.transform = CGAffineTransformIdentity;
        [nav.view setFrame:CGRectMake(0,0, self.bounds.size.width, self.bounds.size.height)];
        
        // fade out the top bar
        [topBar setFrame:CGRectMake(0, -44, 320, 44)];
    }];
}

-(void)closeViewEventHandler: (NSNotification *) notification {
    UIView *viewToRemove = (UIView *) notification.object;    
    [UIView animateWithDuration:.3f animations:^{
        viewToRemove.alpha = 0.f;
        viewToRemove.transform = CGAffineTransformMakeScale(.1f, .1f);
        for(SEMenuItem *item in self.items) {
            item.transform = CGAffineTransformIdentity;
            item.alpha = 1.f;
        }
        [topBar setFrame:CGRectMake(0, 0, 320, 44)];
    } completion:^(BOOL finished) {
        [viewToRemove removeFromSuperview];
    }];
    
    // release the dynamically created navigation var
    [nav release];
}



@end
