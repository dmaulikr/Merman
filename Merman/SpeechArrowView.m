//
//  SpeechArrowView.m
//  Merman
//
//  Created by Michael Cornell on 9/11/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "SpeechArrowView.h"

@interface SpeechArrowView ()
@property (strong, nonatomic) UIBezierPath *arrowPath;
@end

@implementation SpeechArrowView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        [self setup];
    }
    return self;
}

-(void)awakeFromNib {
    [self setup];
}
-(void)setup {
    self.backgroundColor = [UIColor clearColor];
    self.arrowPath = [[UIBezierPath alloc] init];
    [self.arrowPath moveToPoint:CGPointMake(0, 0)];
    CGPoint trCorner = CGPointMake(self.frame.size.width, 0);
    CGPoint brCorner = CGPointMake(self.frame.size.width, self.frame.size.height);
    [self.arrowPath addQuadCurveToPoint:brCorner controlPoint:CGPointMake(20, 60)];
    [self.arrowPath addQuadCurveToPoint:trCorner controlPoint:CGPointMake(30, 30)];
    [self.arrowPath closePath];
    self.fillColor = [UIColor whiteColor];
}
- (void)drawRect:(CGRect)rect {
    [self.fillColor setFill];
    [self.arrowPath fill];
}

@end
