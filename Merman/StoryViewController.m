//
//  StoryViewController.m
//  Merman
//
//  Created by Michael Cornell on 9/11/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "StoryViewController.h"
#import "SpeechArrowView.h"
@import AVFoundation;
@import AudioToolbox;

@interface StoryViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UITextView *storyTextView;
@property (weak, nonatomic) IBOutlet UIButton *advanceButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic) NSUInteger pageIdx;
@property (weak, nonatomic) IBOutlet SpeechArrowView *speechArrowView;
@property (nonatomic) BOOL isTransitioning;
@property (nonatomic) UIEdgeInsets normalInsets;
@property (nonatomic) BOOL isBlushing;

@property (strong, nonatomic) AVAudioPlayer *player;
@end

@implementation StoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.normalInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.storyTextView.textContainerInset = self.normalInsets;
    self.storyTextView.layer.cornerRadius = 25;
    self.storyTextView.layer.masksToBounds = YES;
    self.isTransitioning = false;
    self.isBlushing = false;
    self.pageIdx = 0;
    [self styleToPage:self.story.pages[0]];
    
    self.advanceButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    self.backButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    //start a background sound
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"TheRockShow" ofType:@"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    self.player.numberOfLoops = -1; //infinite loop
    [self.player play];

}
- (IBAction)backUpStory:(id)sender {
    if (!self.isTransitioning && self.pageIdx > 0){
        self.pageIdx--;
        Page *page = self.story.pages[self.pageIdx];
        [self transitionToPage:page forward:NO];
    }
}

- (IBAction)advanceStory:(id)sender {
    if (!self.isTransitioning && self.pageIdx < self.story.pages.count-1){
        self.pageIdx++;
        Page *page = self.story.pages[self.pageIdx];
        [self transitionToPage:page forward:YES];
    }
}

-(void)styleToPage:(Page*)page {
    self.storyTextView.editable = true;
    self.storyTextView.textAlignment = page.alignment;
    UIFont *font = [UIFont fontWithName:page.fontName size:page.fontSize];
    self.storyTextView.font = font;
    self.storyTextView.backgroundColor = page.backgroundColor;
    self.speechArrowView.fillColor = page.backgroundColor;
    self.storyTextView.textColor = page.textColor;
    self.storyTextView.editable = false;
    self.storyTextView.text = page.text;
}

-(void)transitionToPage:(Page*)page forward:(BOOL)movingForward{
    self.isTransitioning = true;
    CGRect origin = self.storyTextView.bounds;
    CGRect right = origin;
    CGRect left = origin;
    right.origin.x += self.storyTextView.bounds.size.width;
    left.origin.x -= self.storyTextView.bounds.size.width;
    
    [UIView animateWithDuration:.33 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.storyTextView.bounds = movingForward ? right : left;
    } completion:^(BOOL finished) {
        if (finished){
            self.storyTextView.bounds = movingForward ? left : right;
            
            [UIView animateWithDuration:.33 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.storyTextView.bounds = origin;
                [self styleToPage:page];
                
                [self.speechArrowView setNeedsDisplay];
            } completion:^(BOOL finished) {
                if (finished){
                    self.isTransitioning = false;
                    if (self.isBlushing != page.triggerBlush){
                        [UIView transitionWithView:self.background duration:.33 options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.background.image =  [UIImage imageNamed:(page.triggerBlush ? @"trevorblush" : @"trevor")];
                        } completion:^(BOOL finished) {
                            if (finished){
                                self.isTransitioning = false;
                                self.isBlushing = page.triggerBlush;
                            }
                        }];
                    }
                    else {
                        self.isTransitioning = false;
                    }
                }
            }];
        }
    }];
}

@end
