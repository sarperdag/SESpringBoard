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
[items addObject:[SEMenuItem initWithTitle:@"facebook" imageName:@"facebook.png" viewController:vc1 removable:YES]];
[items addObject:[SEMenuItem initWithTitle:@"twitter" imageName:@"twitter.png" viewController:vc2 removable:NO]];
[items addObject:[SEMenuItem initWithTitle:@"youtube" imageName:@"youtube.png" viewController:vc1 removable:YES]];
[items addObject:[SEMenuItem initWithTitle:@"linkedin" imageName:@"linkedin.png" viewController:vc2 removable:NO]];
    
// pass the array to a newly created SESpringBoard and add it to your view
SESpringBoard *board = [SESpringBoard initWithTitle:@"Welcome" items:items launcherImage:[UIImage imageNamed:@"navbtn_home.png"]];
[self.view addSubview:board];

```

Screenshots
---------------------

![alt text](http://dl.dropbox.com/u/1124427/sespringboard.png "SESpringBoard Paged")
![alt text](http://dl.dropbox.com/u/1124427/sepringboard_wiggle.png "SESpringBoard Wiggling")



Coming Soon
---------------------
- Ability to drag menu items and change their locations.
- Badges and stuff. 


License
---------------------

Open Source Initiative OSI - The MIT License (MIT):Licensing [OSI Approved License] The MIT License (MIT)

Copyright (c) 2011 Sarp Erdag

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
