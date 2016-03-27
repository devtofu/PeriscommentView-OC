//
//  ViewController.m
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import "TTViewController.h"
#import "TTPeriscommentView.h"

static void dispatchOnMainThread(CGFloat delay, void(^completion)(void)) {
    if (delay == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
            }
        });
        return;
    }
    
    dispatch_time_t d_time = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(d_time, dispatch_get_main_queue(), ^{
        if (completion) {
            completion();
        }
    });
}

@interface TTViewController ()

@property (weak, nonatomic) IBOutlet TTPeriscommentView *periscommentView;

@end

@implementation TTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self showComments];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showComments {
    UIImage *avatar = [UIImage imageNamed:@"twitterProfile.jpeg"];
    NSString *name = @"@yoavlt";
    dispatchOnMainThread(1, ^{
       NSString *comment = @"Awesome!";
        [self.periscommentView addCellWithName:name comment:comment profileImage:avatar];
    });
    
    dispatchOnMainThread(5, ^{
        NSString *comment = @"Hooooo!";
        [self.periscommentView addCellWithName:name comment:comment profileImage:avatar];
    });
    dispatchOnMainThread(7, ^{
        NSString *comment = @"bullshit!";
        [self.periscommentView addCellWithName:name comment:comment profileImage:avatar];
    });
    dispatchOnMainThread(9, ^{
        NSString *comment = @"WTF!";
        [self.periscommentView addCellWithName:name comment:comment profileImage:avatar];
    });
    dispatchOnMainThread(11, ^{
        NSString *comment = @"Supported looooooong line comments.!";
        [self.periscommentView addCellWithName:name comment:comment profileImage:avatar];
    });
}


@end
