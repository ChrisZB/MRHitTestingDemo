//
//  RespondView.m
//  RespondDemo
//
//  Created by BloodSugar on 2017/4/21.
//  Copyright © 2017年 OFweek. All rights reserved.
//

#import "RespondView.h"

@interface RespondView()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, weak) UIView *weakView;

@end

@implementation RespondView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
        [self addSubview: _nameLabel];
    }
    return self;
}

- (void)setName:(NSString *)name {
    _name = name;
    _nameLabel.text = name;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@",[super hitTest:point withEvent:event]);
    return [super hitTest:point withEvent:event];
}

- (NSString *)description {
    NSString *logStr = [NSString stringWithFormat:@"%@",self.name];
    return logStr;
}

@end
