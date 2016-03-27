//
//  TTPeriscommentMark.m
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import "TTPeriscommentMark.h"
#import "TTPeriscommentUtils.h"


@interface TTPeriscommentMark ()

@property (nonatomic, strong) UIColor *color;

@end

@implementation TTPeriscommentMark

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image {
    if (self = [super initWithFrame:frame]) {
        [self tt_layoutSubviews:image];
    }
    return self;
}

- (void)tt_layoutSubviews:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.frame;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.frame];
    backgroundView.backgroundColor = self.color;
    [self addSubview:imageView];
    [self addSubview:backgroundView];
}


- (UIColor *)color {
    if (!_color) {
        _color = [TTPeriscommentUtils colorGenerator];
    }
    return _color;
}
@end
