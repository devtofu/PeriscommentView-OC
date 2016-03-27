//
//  TTPeriscommentView.h
//  PeriscommentViewDemo-OC
//
//  Created by tofu on 3/26/16.
//  Copyright © 2016 iOS Tofu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTPeriscommentView : UIView

- (void)addCellWithName:(NSString *)name
                comment:(NSString *)comment
           profileImage:(UIImage *)profileImage;

@end

NS_ASSUME_NONNULL_END