//
//  Created by Chen Zeyu on 5/7/14.
//  Copyright (c) 2014 Chen Zeyu. All rights reserved.
//

#import "FYAnimationGuideView.h"

#define HEIGHT_SCREEN [UIScreen mainScreen].bounds.size.height
#define WIDTH_SCREEN [UIScreen mainScreen].bounds.size.width
@interface FYAnimationGuideView ()
@property NSUInteger currentPage;
@property NSArray *pages;
@end

@implementation FYAnimationGuideView

- (id)initWithPages:(NSArray *)pages{
    self = [super init];
    if(self){
        self.pages = pages;
        [self applyDefaults];
        for(FYGuidePage *p in self.pages){
            [self.scrollView addSubview:p];
        }
    }
    return self;
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
    [(FYGuidePage *)[self.pages firstObject] show];
}

#pragma mark - private

- (void)applyDefaults{
    self.frame = [UIScreen mainScreen].bounds;
    self.currentPage = 0;
    [self buildDefaultScrollView];
    [self buildDefaultPageControl];
    [self buildDefaultSkipButton];
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    [self addSubview:self.skipButton];
}

- (void)buildDefaultScrollView{
    UIColor *defaultColor = [UIColor colorWithRed:245 green:246 blue:247 alpha:1];
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = defaultColor;
    self.backgroundColor = defaultColor;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(WIDTH_SCREEN * self.pages.count, HEIGHT_SCREEN);
    self.scrollView.pagingEnabled = YES;
}

- (void)buildDefaultPageControl{
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(121, HEIGHT_SCREEN - 57 - 25, WIDTH_SCREEN - 121 * 2, 18);
    self.pageControl.numberOfPages = self.pages.count;
    self.pageControl.userInteractionEnabled = NO;
}

- (void)buildDefaultSkipButton{
    self.skipButton = [[UIButton alloc] initWithFrame:CGRectMake(0, HEIGHT_SCREEN - 57, 320, 57)];
    self.skipButton.backgroundColor = [UIColor blueColor];
    [self.skipButton setTitle:@"skip" forState:UIControlStateNormal];
    [self.skipButton addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
    [self.skipButton setAccessibilityLabel:self.skipButtonText];
}

- (void)skip {
    if([self.delegate respondsToSelector:@selector(guideDidFinish:)]){
        [self.delegate guideDidFinish:self];
    }
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}

- (void)dismiss{
    [self removeFromSuperview];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSUInteger page = floor((self.scrollView.contentOffset.x - WIDTH_SCREEN / 2) / WIDTH_SCREEN) + 1;
    if (page != self.currentPage){
        self.pageControl.currentPage = page;
        [(FYGuidePage *)self.pages[self.currentPage] reset];
        self.currentPage = page;
        [(FYGuidePage *)self.pages[self.currentPage] show];
    }
}

@end
