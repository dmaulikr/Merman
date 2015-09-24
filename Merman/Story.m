//
//  Story.m
//  Merman
//
//  Created by Michael Cornell on 9/11/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Story.h"
#import "Page.h"



@interface Story ()
@end
@implementation Story
+(instancetype)sampleStory {
    Story *story = [[Story alloc] init];
    Page *proto = [[Page alloc] init];
    proto.fontName = @"Mermaid-Bold";
    proto.fontSize = 18;
    proto.textColor = [UIColor colorWithWhite:.22 alpha:1];
    proto.backgroundColor = [UIColor colorWithRed:.8 green:.9 blue:1 alpha:.7];
    [story setPrototypePage:proto];
    
    Page *pg1 = [story makePage];
    pg1.text = @"\n\nA   Very Goosey Anniversary";
    pg1.fontName = @"MermaidSwashCaps-Bold";
    pg1.fontSize = 30;
    pg1.alignment = NSTextAlignmentCenter;
    pg1.backgroundColor = [UIColor colorWithRed:1 green:.9 blue:.8 alpha:.7];
    
    Page *pg2 = [story makePage];
    pg2.text = @"\n\nA  Tale of Love, Glubs, and Honks\n~~~\nby Mergoose";
    pg2.fontName = @"MermaidSwashCaps-Bold";
    pg2.fontSize = 26;
    pg2.alignment = NSTextAlignmentCenter;
    pg2.backgroundColor = [UIColor colorWithRed:1 green:.9 blue:.8 alpha:.7];
    
    Page *pg3 = [story makePage];
    pg3.text = @"Dear Goosey\n    I finished the Merman App! Sorta! There's always more to be done, but I think this is good enough to tell my lovely goose a lovely story.\n    It's been a wonderful year with you and I can't wait for more. It's been up, down, and every which way, and I got to be with you the whole time. I love you Erin - Happy Anniversary.\n        -Mike";
    pg3.triggerBlush = true;
    
    Page *pg4 = [story makePage];
    pg4.text = @"I wanted to make something cute for you, because you're always making cute things for me. You're simply the best. I couldn't enumerate all the ways you make me smile even if I tried (but I still will).";
    
    Page *pg5 = [story makePage];
    pg5.text = @"  * You're a goose when you tackle me with kisses, especially if I'm not awake yet\n  * You're pretty in everything, most notably nothing\n  * You're smart and teach me something new everyday\n  * You're kind and giving, even on tough days\n  * You're patient when I'm a sleepy grump who can't be budged out of bed";
    
    Page *pg6 = [story makePage];
    pg6.text = @"\nYou make me feel happy and safe in my own skin. I've never felt so loved, respected, encouraged in my life. I am so grateful to have you in my life Erin. It's just wonderful. You are a dream come true. Thank you.";
    
    Page *chap2Proto = [story makePage];
    chap2Proto.backgroundColor = [UIColor colorWithRed:.8 green:1 blue:.9 alpha:.7];
    chap2Proto.fontSize = 22;
    story.prototypePage = chap2Proto;
    
    Page *pg7 = [story makePage];
    pg7.text = @"\nChapter 2\n\nThe Goose and the Merman";
    pg7.fontName = @"MermaidSwashCaps-Bold";
    pg7.fontSize = 26;
    pg7.alignment = NSTextAlignmentCenter;
    
    Page *pg8 = [story makePage];
    pg8.text = @"There once was a Merman who lived near the sea with his true love, a goose by the name of Goose. Merman and Goose were very happy together, splashing in the waves, going to the park on the beach, playing skeeball, and generally being silly.";
    
    Page *pg9 = [story makePage];
    pg9.text = @"The Merman didn't want for anything. He had tons of shells, many sand castle buckets, a large set of spoons, and even a decent internet speed. But one day, everything changed when Goose suddenly left! She had flown off to Shadow Island and hadn't returned that night.";
    
    Page *pg10 = [story makePage];
    pg10.text = @"Worried, Merman started swimming for Shadow Island (S.I. for short). When he got there, he still couldn't find her! He looked up and down the beaches and asked every sailor he could find if they'd seen her. They all said no. Finally, he decided he'd have to search the mainland.";
    
    Page *pg11 = [story makePage];
    pg11.text = @"How would Merman search? He had a tail, which would make trying to walk very silly.\n\nUndeterred, Merman decided to hop his way around.";
    
    Page *pg12 = [story makePage];
    pg12.text = @"Hoping around, Merman had no luck. Goose could just not be found on the land. Merman asked around, and some friendly people told him to check where Goose's parents lived. This posed an even bigger problem. Merman can't fly!";
    
    Page *pg13 = [story makePage];
    pg13.text = @"Merman had tried so hard, and wasn't going to give up on his Goose now. He hopped and hopped and hopped some more! Each time Merman hopped higher, and each time Merman flapped harder, until hey started flying through the sky!";
    
    Page *pg14 = [story makePage];
    pg14.text = @"\n\nHe was flying just like Goose!\n\nHe was a Mergoose!";
    pg14.fontSize = 26;
    
    Page *pg15 = [story makePage];
    pg15.text = @"Mergoose flew to Goose's parents house and found Goose ponysitting. \n\nGoose sure was surprised to see Mergoose up in the air!";
    
    
    Page *pg16 = [story makePage];
    pg16.text = @"Mergoose explained how worried he was when she was missing. Goose explained that she had told him she was ponysitting last week and even texted him to remind him, and he'd forgotten.";
    pg16.triggerBlush = true;

    
    Page *pg17 = [story makePage];
    pg17.text = @"\n\n\n\"Oh\"";
    pg17.fontSize = 30;
    
    Page *pg18 = [story makePage];
    pg18.text = @"Then Goose and Mergoose went home with the ponies and lived happily ever after.";
    pg18.triggerBlush = true;

    
    Page *pg19 = [story makePage];
    pg19.text = @"\n\n\nThe End.";
    pg19.fontSize = 30;
    
    Page *pg20 = [story makePage];
    pg20.text = @"\n\n\n(Honk)";
    pg20.fontSize = 30;
    pg20.triggerBlush = true;
    
    [story.pages addObjectsFromArray:@[pg1, pg2, pg3, pg4, pg5, pg6, pg7, pg8, pg9, pg10,
                                       pg11,pg12,pg13,pg14,pg15,pg16,pg17,pg18,pg19,pg20]];
    return story;
}

-(id)initWithText:(NSString *)text pageBreak:(NSString *)pageBreak{
    self = [self init];
    if (self){
        NSArray *textPages = [text componentsSeparatedByString:pageBreak];
        NSMutableArray *pages = [NSMutableArray new];
        for (NSString *text in textPages){
            Page *page = [[Page alloc] initWithText:text];
            [pages addObject:page];
        }
        self.pages = [pages copy];
    }
    return self;
}
-(id)init {
    self = [super init];
    if (self){
        self.pages = [NSMutableArray new];
        self.prototypePage = [[Page alloc] init];
    }
    return self;
}

-(Page*)makePage {
    return [self.prototypePage copy];
}

@end
