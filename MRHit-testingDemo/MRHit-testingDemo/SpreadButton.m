//
//  SpreadButton.m
//  RespondDemo
//
//  Created by BloodSugar on 2017/4/21.
//  Copyright © 2017年 OFweek. All rights reserved.
//

#import "SpreadButton.h"

@implementation SpreadButton

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    return CGRectContainsPoint(HitTestingBounds(self.bounds, self.minimumHitTestWidth, self.minimumHitTestHight), point);
}

CGRect HitTestingBounds(CGRect bounds, CGFloat minimumHitTestWidth, CGFloat minimumHitTestHeight) {
    CGRect hitTestingBounds = bounds;
    if (minimumHitTestWidth > bounds.size.width) {
        hitTestingBounds.size.width = minimumHitTestWidth;
        hitTestingBounds.origin.x -= (hitTestingBounds.size.width - bounds.size.width)/2;
    }
    if (minimumHitTestHeight > bounds.size.height) {
        hitTestingBounds.size.height = minimumHitTestHeight;
        hitTestingBounds.origin.y -= (hitTestingBounds.size.height - bounds.size.height)/2;
    }
    return hitTestingBounds;
}

@end
