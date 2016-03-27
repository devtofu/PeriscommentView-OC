//
//  TTPeriscommentUtils.h
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@class TTPeriscommentLayout;
@class TTPeriscommentFont;

@interface TTPeriscommentUtils : NSObject

+ (UIColor *)colorGenerator;

@end


@interface TTPeriscommentConfig : NSObject

@property (nonatomic, strong, readonly) TTPeriscommentLayout *layout;
@property (nonatomic, strong, readonly) TTPeriscommentFont *commentFont;
@property (nonatomic, strong, readonly) TTPeriscommentFont *nameFont;
@property (nonatomic, assign, readonly) CGFloat disappearDuration;
@property (nonatomic, assign, readonly) CGFloat appearDuration;


@end

@interface TTPeriscommentLayout : NSObject

@property (nonatomic, assign, readonly) CGFloat offset;
@property (nonatomic, assign, readonly) CGFloat padding;
@property (nonatomic, assign, readonly) CGFloat commentSpace;
@property (nonatomic, assign, readonly) CGFloat cellSpace;
@property (nonatomic, assign, readonly) CGFloat maximumWidth;
@property (nonatomic, assign, readonly) CGFloat markWidth;
@property (nonatomic, assign, readonly) BOOL allowLineBreak;
@property (nonatomic, strong, readonly) UIColor *backgroundColor;

- (CGFloat)prepareCommentMaxWidth;

@end

@interface TTPeriscommentFont : NSObject

- (instancetype)initWithFont:(UIFont *)font color:(UIColor *)color;

@property (nonatomic, strong, readonly) UIFont *font;
@property (nonatomic, strong, readonly) UIColor *color;

@end


NS_ASSUME_NONNULL_END