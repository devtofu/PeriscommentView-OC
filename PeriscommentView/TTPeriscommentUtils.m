//
//  TTPeriscommentUtils.m
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import "TTPeriscommentUtils.h"

@implementation TTPeriscommentUtils

+ (UIColor *)colorGenerator {
    
    UIColor *red = [UIColor colorWithRed:0.96 green:0.26 blue:0.21 alpha:0.7];
    UIColor *pink = [UIColor colorWithRed:0.91 green:0.12 blue:0.38 alpha:0.7];
    UIColor *purple = [UIColor colorWithRed:0.61 green:0.15 blue:0.69 alpha:0.7];
    UIColor *blue = [UIColor colorWithRed:0.12 green:0.59 blue:0.95 alpha:0.7];
    
    UIColor *green = [UIColor colorWithRed:0.3 green:0.69 blue:0.31 alpha:0.7];
    
    UIColor *yellow = [UIColor colorWithRed:1.0 green:0.92 blue:0.23 alpha:0.7];
    UIColor *orange = [UIColor colorWithRed:1.0 green:0.60 blue:0 alpha:0.7];
    
    
    NSArray *colors = @[red, pink, purple, blue, green, yellow, orange];
    uint32_t index = arc4random_uniform((uint32_t)colors.count);
    
    return colors[(NSInteger)index];
}

@end


@implementation TTPeriscommentConfig

- (instancetype)init {
    if (self = [super init]) {
        _disappearDuration = 6.0;
        _appearDuration = 1.0;
        _layout = [[TTPeriscommentLayout alloc] init];
        _commentFont = [[TTPeriscommentFont alloc] initWithFont:[UIFont systemFontOfSize:14]
                                                          color:[UIColor blackColor]];
        _nameFont = [[TTPeriscommentFont alloc] initWithFont:[UIFont systemFontOfSize:12]
                                                          color:[UIColor lightGrayColor]];
    }
    return self;
}

@end

@implementation TTPeriscommentLayout

- (instancetype)init {
    if (self = [super init]) {
        _offset = 10.0;
        _padding = 2.5;
        _commentSpace = 1.5;
        _cellSpace = 4.0;
        _maximumWidth = 200.0;
        _markWidth = 40.0;
        _allowLineBreak = YES;
        _backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (CGFloat)prepareCommentMaxWidth {
    return self.maximumWidth - (self.padding * 2 + self.markWidth + self.offset);
}

@end


@implementation TTPeriscommentFont

- (instancetype)initWithFont:(UIFont *)font color:(UIColor *)color {
    if (self = [super init]) {
        _color = color;
        _font = font;
    }
    return self;
}

@end

