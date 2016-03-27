//
//  TTPeriscommentCell.h
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTPeriscommentMark.h"
#import "TTPeriscommentUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTPeriscommentCell : UIView


- (instancetype)initWithFrame:(CGRect)frame
                         name:(NSString *)name
                      comment:(NSString *)comment
                 profileImage:(UIImage *)profileImage;

- (instancetype)initWithFrame:(CGRect)frame
                         name:(NSString *)name
                      comment:(NSString *)comment
                 profileImage:(UIImage *)profileImage
                       config:(TTPeriscommentConfig *)config;

@end


@interface TTPeriscommentLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame
                         font:(TTPeriscommentFont *)commentfont
               allowLineBreak:(BOOL)allow
                     maxWidth:(CGFloat)maxWidth;

@property (nonatomic, assign) BOOL allowLineBreak;
@property (nonatomic, assign, readonly) CGFloat maxCommentWidth;


@end


NS_ASSUME_NONNULL_END