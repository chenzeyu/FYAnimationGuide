//
//  Created by Chen Zeyu on 5/7/14.
//  Copyright (c) 2014 Chen Zeyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POP.h"
#import "FYGuidePage.h"

@class FYAnimationGuideView;

@protocol FYGuideDelegate <NSObject>

- (void)guideDidFinish:(FYAnimationGuideView *)view;

@end

@interface FYAnimationGuideView : UIView <UIScrollViewDelegate>

- (id)initWithPages:(NSArray *)pages;
@property (nonatomic, assign) id<FYGuideDelegate> delegate;
@property (nonatomic, assign) NSString *skipButtonText;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *skipButton;
- (void)showInView:(UIView *)view;

@end
