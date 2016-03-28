# PeriscommentView-OC
This is the Objective-C version of PeriscommentView.


## Overview

Thanks for swift release [@yovalt](https://github.com/yoavlt/PeriscommentView) provided by this demo version is Objective-C, [you can click here to see swift release!](https://github.com/yoavlt/PeriscommentView)

![screenshot](https://github.com/devtofu/PeriscommentView-OC/blob/master/screenshot/periscommentViewDemoLow.gif)

## Usage

##### Swift Usage

```swift
import PeriscommentView

let periscommentView: PeriscommentView = ...
let profileImage = UIImage(named: "hoge.png")!
let name = "name"
let comment = "comment"
PeriscommentView.addCell(profileImage, name: name, comment: comment)
```


##### Objective-C Usage

```objective-c
TTPeriscommentView *periscommentView = [TTPeriscommentView initWithFrame:...];
UIImage *avatar = [UIImage imageNamed:@"twitterProfile.jpeg"];
NSString *name = @"@yoavlt";
NSString *comment = @"Awesome!";
[periscommentView addCellWithName:name comment:comment profileImage:avatar];
```

## License

Please respect the original author [@yovalt](https://github.com/yoavlt/PeriscommentView), reproduced please indicate the source