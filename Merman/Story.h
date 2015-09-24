//
//  Story.h
//  Merman
//
//  Created by Michael Cornell on 9/11/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Page.h"

@interface Story : NSObject
@property (strong, nonatomic) NSMutableArray *pages;
@property (strong, nonatomic) Page *prototypePage;

+(instancetype)sampleStory;
-(id)initWithText:(NSString*)text pageBreak:(NSString*)pageBreak;
-(void)setPrototypePage:(Page*)prototypePage;

@end
