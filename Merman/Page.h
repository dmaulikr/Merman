//
//  Page.h
//  Merman
//
//  Created by Michael Cornell on 9/11/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Page : NSObject <NSCopying>

@property (strong, nonatomic) NSString *fontName;
@property (nonatomic) NSUInteger fontSize;
@property (nonatomic) NSTextAlignment alignment;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *backgroundColor;
@property (nonatomic) BOOL triggerBlush;

-(id)initWithProperties:(NSDictionary*)properties;
-(id)initWithText:(NSString*)text;
@end
