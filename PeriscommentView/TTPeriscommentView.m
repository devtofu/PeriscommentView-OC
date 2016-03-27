//
//  TTPeriscommentView.m
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import "TTPeriscommentView.h"
#import "TTPeriscommentUtils.h"
#import "TTPeriscommentCell.h"

static void tt_release(UIView *view) {
    view = nil;
}

@interface TTPeriscommentView ()

@property (nonatomic, strong) NSMutableArray *visibleCells;
@property (nonatomic, strong) TTPeriscommentConfig *config;

@end

@implementation TTPeriscommentView

- (instancetype)initWithFrame:(CGRect)frame {
    TTPeriscommentConfig *config = [[TTPeriscommentConfig alloc] init];
    return [self initWithFrame:frame config:config];
}

- (instancetype)initWithFrame:(CGRect)frame config:(TTPeriscommentConfig *)config {
    if (self = [super initWithFrame:frame]) {
        self.config = config;
        self.visibleCells = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.config = [[TTPeriscommentConfig alloc] init];
        self.visibleCells = [NSMutableArray array];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    self.backgroundColor = self.config.layout.backgroundColor;
}

- (void)addCellWithName:(NSString *)name comment:(NSString *)comment profileImage:(UIImage *)profileImage {
    CGRect rect = CGRectZero;
    TTPeriscommentCell *cell = [[TTPeriscommentCell alloc] initWithFrame:rect name:name comment:comment profileImage:profileImage config:self.config];
    [self addCell:cell];

}

- (void)addCell:(TTPeriscommentCell *)commentCell {
    commentCell.frame = CGRectMake(15.f, self.frame.size.height, commentCell.frame.size.width, commentCell.frame.size.height);
    [self addSubview:commentCell];
    [self.visibleCells addObject:commentCell];
    [self moveCellWithAnimation:commentCell];
    [self hideCellWithAnimatioin:commentCell];
}

- (void)moveCellWithAnimation:(TTPeriscommentCell *)cell {
    [UIView animateWithDuration:self.config.appearDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGFloat dy = cell.frame.size.height + self.config.layout.cellSpace;
        for (TTPeriscommentCell *c in self.visibleCells) {
            CGAffineTransform originTransform = c.transform;
            CGAffineTransform newTransform = CGAffineTransformMakeTranslation(0, -dy);
            c.transform = CGAffineTransformConcat(originTransform, newTransform);
        }
    } completion:nil];
}

- (void)hideCellWithAnimatioin:(TTPeriscommentCell *)cell {
    [UIView animateWithDuration:self.config.disappearDuration delay:self.config.appearDuration options:UIViewAnimationOptionCurveEaseIn animations:^{
        cell.alpha = 0;
    } completion:^(BOOL finished) {
        [cell removeFromSuperview];
        [self.visibleCells removeObject:cell];
//        tt_release(cell);
    }];
}


@end
