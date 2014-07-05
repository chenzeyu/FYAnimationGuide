//
//  Created by Chen Zeyu on 5/7/14.
//  Copyright (c) 2014 Chen Zeyu. All rights reserved.
//
#define WIDTH_SCREEN 320
#define HEIGHT_SCREEN [UIScreen mainScreen].bounds.size.height
#import "FYViewController.h"
#import <POP.h>

@interface FYViewController ()

@end

@implementation FYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *arr = [self setupPages];
    FYAnimationGuideView *v = [[FYAnimationGuideView alloc] initWithPages:arr];
    v.delegate = self;
    v.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    v.pageControl.currentPageIndicatorTintColor= [UIColor blueColor];
    [v showInView:self.view];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// create welcome pages here
- (NSArray *)setupPages{
    
    /*======================
      Page 1
     =======================
     */
    NSUInteger currentPage = 0;
    FYGuidePage *page1 = [[FYGuidePage alloc] initWithFrame:CGRectMake(WIDTH_SCREEN * currentPage, 0, WIDTH_SCREEN, HEIGHT_SCREEN - 57)];
    UILabel *title1 = [[UILabel alloc] initWithFrame: CGRectMake(40 + WIDTH_SCREEN, 50, 240, 80)];
    title1.text = @"Welcome To FYGuide";
    title1.font = [UIFont boldSystemFontOfSize:24];
    POPBasicAnimation *page1Anim1 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    page1Anim1.toValue=[NSValue valueWithCGRect:CGRectOffset(title1.frame, - WIDTH_SCREEN, 0)];
    page1Anim1.duration = 0.5f;
    UIImageView *rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Image1"]];
    rightView.frame = CGRectMake(98, 183, 224, 224);
    POPBasicAnimation *page1Anim2 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    page1Anim2.toValue = [NSValue valueWithCGRect:CGRectOffset(rightView.frame, - 50, 0)];
    page1Anim2.duration = 0.8f;
    
    page1.animations = @[page1Anim1, page1Anim2];
    page1.animatableViews = @[title1, rightView];
    
    /*======================
      Page 2
     =======================
     */
    currentPage++;
    FYGuidePage *page2 = [[FYGuidePage alloc] initWithFrame:CGRectMake(WIDTH_SCREEN * currentPage, 0, WIDTH_SCREEN, HEIGHT_SCREEN - 57)];
    UILabel *title2 = [[UILabel alloc] initWithFrame:CGRectMake(40 + WIDTH_SCREEN, 50, 240, 80)];
    title2.text = @"Welcome To FYGuide";
    title2.font = [UIFont boldSystemFontOfSize:24];
    POPBasicAnimation *anim2 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    anim2.toValue=[NSValue valueWithCGRect:CGRectOffset(title2.frame, - WIDTH_SCREEN, 0)];
    anim2.duration = 0.5f;
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Image2"]];
    // from scale 0.1 to 1
    image2.frame = CGRectMake((WIDTH_SCREEN - WIDTH_SCREEN/10)/2, 166 + (224 - 224.0/10)/2 , 244.0/10, 244.0/10);
    POPSpringAnimation *springAnim = [POPSpringAnimation animation];
    springAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    springAnim.toValue = [NSValue valueWithCGSize:CGSizeMake(10, 10)];
    springAnim.velocity = [NSValue valueWithCGSize:CGSizeMake(20, 20)];
    page2.animations = @[anim2, springAnim];
    page2.animatableViews = @[title2, image2];
    
    
    /*======================
      Page 3
     =======================
     */
    currentPage++;
    FYGuidePage *page3 = [[FYGuidePage alloc] initWithFrame:CGRectMake(WIDTH_SCREEN * currentPage, 0, WIDTH_SCREEN, HEIGHT_SCREEN - 57)];
    UILabel *title3 = [[UILabel alloc] initWithFrame:CGRectMake(40 + WIDTH_SCREEN, 50, 240, 80)];
    title3.text = @"Welcome To FYGuide";
    title3.font = [UIFont boldSystemFontOfSize:24];
    POPBasicAnimation *anim3 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    anim3.toValue=[NSValue valueWithCGRect:CGRectOffset(title2.frame, - WIDTH_SCREEN, 0)];
    anim3.duration = 0.5f;
    
    UIImageView *image3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Image3"]];
    image3.frame = CGRectMake((WIDTH_SCREEN - WIDTH_SCREEN/10)/2, 166 + (224 - 224.0/10)/2 , 244/10, 244.0/10);
    POPSpringAnimation *springAnim3 = [POPSpringAnimation animation];
    springAnim3.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    springAnim3.toValue = [NSValue valueWithCGSize:CGSizeMake(10, 10)];
    springAnim3.velocity = [NSValue valueWithCGSize:CGSizeMake(20, 20)];
    
    page3.animations = @[anim3, springAnim3];
    page3.animatableViews = @[title3, image3];
    return @[page1,page2,page3];
    
}

- (void)guideDidFinish:(FYAnimationGuideView *)view{
    NSLog(@"Finished");
}
@end
