SESpringBoard
====================

Introduction
---------------------

SESpringBoard is an easy to use launcher view for you to use in your iPhone apps. Just add all the files under SESpringBoard into your project and you are good to go!

Usage
---------------------

```objective-c

vc1 = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
vc2 = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
// create or reference more view controllers here
// also be sure to extend your view controllers from SEViewController
    
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

![alt text](http://s3.amazonaws.com/cocoacontrols_production/ios_screens/424/full.png?1320540435 "SESpringBoard")

