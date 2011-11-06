SESpringBoard
====================

Introduction
---------------------

SESpringBoard is an easy to use launcher view for you to use in your iPhone apps. Details on how to implement stuff is inside the demo project.

Implementation
---------------------

```objective-c

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
    
// pass the array to a newly created SESpringBoard and add it to your view
SESpringBoard *board = [SESpringBoard initWithTitle:@"Welcome" items:items launcherImage:[UIImage imageNamed:@"navbtn_home.png"]];
[self.view addSubview:board];

```

Screenshots
---------------------
Coming Soon!

