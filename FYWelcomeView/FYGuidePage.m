//
//  Created by Chen Zeyu on 5/7/14.
//  Copyright (c) 2014 Chen Zeyu. All rights reserved.
//

#import "FYGuidePage.h"
#import <POP.h>

@interface FYGuidePage ()
@property NSUInteger key;
@end
@implementation FYGuidePage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.key = 0;
    }
    return self;
}

- (void)show {
    for (NSUInteger i = 0; i < self.animations.count; i++) {
        UIView *v = self.animatableViews[i];
        [self addSubview:v];
        POPAnimation *anim = self.animations[i];
        [v pop_addAnimation:anim forKey:[self getAnimationKey]];
    
    }
}

- (NSString *)getAnimationKey{
    return [@(self.key++) stringValue];
}

- (void)reset{
    for (UIView *v in self.animatableViews){
        [v removeFromSuperview];
    }
}
@end
