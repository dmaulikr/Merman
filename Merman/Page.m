//
//  Page.m
//  Merman
//
//  Created by Michael Cornell on 9/11/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Page.h"

@interface Page ()
@end

@implementation Page
-(id)initWithProperties:(NSDictionary *)properties {
    self = [self init];
    if (self){
        if (properties[@"text"]){
            self.text = properties[@"text"];
        }
        if (properties[@"fontname"]){
            self.fontName = properties[@"fontName"];
        }
        if (properties[@"fontsize"]){
            self.fontSize = [properties[@"fontsize"] unsignedIntegerValue];
        }
        if (properties[@"alignment"]){
            NSString *alignmentStr = [properties[@"alignment"] lowercaseString];
            if ([alignmentStr isEqualToString:@"right"]){
                self.alignment = NSTextAlignmentRight;
            }
            else if ([alignmentStr isEqualToString:@"center"]){
                self.alignment = NSTextAlignmentCenter;
            }
            else if ([alignmentStr isEqualToString:@"justify"]){
                self.alignment = NSTextAlignmentJustified;
            }
        }
        //TODO textColor and bgColor
    }
    return self;
}

-(id)initWithText:(NSString *)text {
    self = [self init];
    if (self){
        self.text = text;
    }
    return self;
}

-(id)init {
    self = [super init];
    if (self){
        self.text = @"";
        self.fontName = @"Helvetica";
        self.fontSize = 18;
        self.alignment = NSTextAlignmentLeft;
        
        self.textColor = [UIColor blackColor];
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:.7];
        self.triggerBlush = false;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    Page *copy = [[Page alloc] init];
    copy.text = self.text;
    copy.fontName = self.fontName;
    copy.fontSize = self.fontSize;
    copy.alignment = self.alignment;
    copy.textColor = self.textColor;
    copy.backgroundColor = self.backgroundColor;
    copy.triggerBlush = self.triggerBlush;
    return copy;
}
@end
