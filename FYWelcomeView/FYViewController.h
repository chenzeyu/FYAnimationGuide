//
//  Created by Chen Zeyu on 5/7/14.
//  Copyright (c) 2014 Chen Zeyu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FYAnimationGuideView.h"

@interface FYViewController : UIViewController <FYGuideDelegate>
- (void)guideDidFinish:(FYAnimationGuideView *)view;
@end
