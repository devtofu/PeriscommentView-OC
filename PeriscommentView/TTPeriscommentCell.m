//
//  TTPeriscommentCell.m
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import "TTPeriscommentCell.h"

@interface TTPeriscommentCell ()


@property (nonatomic, strong) TTPeriscommentMark *mark;
@property (nonatomic, strong) TTPeriscommentLabel *commentLabel;
@property (nonatomic, strong) TTPeriscommentConfig *config;
@property (nonatomic, strong) UILabel *nameLabel;


@end

@implementation TTPeriscommentCell

- (instancetype)initWithFrame:(CGRect)frame name:(NSString *)name comment:(NSString *)comment profileImage:(UIImage *)profileImage {
    TTPeriscommentConfig *config = [[TTPeriscommentConfig alloc] init];
    return [self initWithFrame:frame name:name comment:comment profileImage:profileImage config:config];
}

- (instancetype)initWithFrame:(CGRect)frame name:(NSString *)name comment:(NSString *)comment profileImage:(UIImage *)profileImage config:(TTPeriscommentConfig *)config {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        self.config = config;
        self.nameLabel.text = name;
        self.commentLabel.text = comment;
        [self.nameLabel sizeToFit];
        [self.commentLabel sizeToFit];
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.commentLabel];
        
        [self resetFrame:profileImage];
        
        [self addSubview:self.mark];
        
    }
    return self;
}

- (void)resetFrame:(UIImage *)image {
    
    TTPeriscommentConfig *config = self.config;
    CGFloat commentWidth = MAX(self.nameLabel.frame.size.width, self.commentLabel.frame.size.width);
    CGFloat inferedWidth = config.layout.markWidth + config.layout.offset + commentWidth + config.layout.padding * 2;
    CGFloat width = MIN(inferedWidth, config.layout.maximumWidth);
    CGFloat height = config.layout.padding * 2 + config.layout.commentSpace + self.nameLabel.frame.size.height + self.commentLabel.frame.size.height;
    
    // cell frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
    
    // mark frame
    CGSize markSize = CGSizeMake(config.layout.markWidth, height);
    CGRect markRect = CGRectMake(0, 0, markSize.width, markSize.height);
    self.mark = [[TTPeriscommentMark alloc] initWithFrame:markRect image:image];
    
    // comment frame
    CGRect commentOriginframe = self.commentLabel.frame;
    commentOriginframe.origin.y += self.nameLabel.frame.size.height;
    self.commentLabel.frame = commentOriginframe;
    
    
}

#pragma mark - getter
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        TTPeriscommentConfig *config = self.config;
        CGPoint namePoint = CGPointMake(config.layout.markWidth + config.layout.offset, config.layout.padding);
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(namePoint.x, namePoint.y, 0, 0)];
        nameLabel.font = config.nameFont.font;
        nameLabel.textColor = config.nameFont.color;
        _nameLabel = nameLabel;
    }
    return _nameLabel;
}

- (TTPeriscommentLabel *)commentLabel {
    if (!_commentLabel) {
        TTPeriscommentConfig *config = self.config;
        CGFloat commentMaxWidth = [config.layout prepareCommentMaxWidth];
        CGPoint commentPoint = CGPointMake(config.layout.markWidth + config.layout.offset, config.layout.padding + config.layout.commentSpace);
        TTPeriscommentLabel *commentLabel = [[TTPeriscommentLabel alloc] initWithFrame:CGRectMake(commentPoint.x, commentPoint.y, 0, 0) font:config.commentFont allowLineBreak:config.layout.allowLineBreak maxWidth:commentMaxWidth];
        _commentLabel = commentLabel;
    }
    return _commentLabel;
}

@end



@implementation TTPeriscommentLabel

- (instancetype)initWithFrame:(CGRect)frame font:(TTPeriscommentFont *)commentfont allowLineBreak:(BOOL)allow maxWidth:(CGFloat)maxWidth {
    if (self = [super initWithFrame:frame]) {
        _allowLineBreak = allow;
        _maxCommentWidth = maxWidth;
        self.textColor = commentfont.color;
        self.font = commentfont.font;
    }
    return self;
}

- (void)sizeToFit {
    if (self.allowLineBreak) {
        self.lineBreakMode = NSLineBreakByWordWrapping;
        self.numberOfLines = 0;
    }
    [super sizeToFit];
    [self resetSize];
    [super sizeToFit];
}

- (void)resetSize {
    CGFloat width = MIN(self.maxCommentWidth, self.frame.size.width);
    CGRect originFrame = self.frame;
    originFrame.size.width = width;
    self.frame = originFrame;
}

@end