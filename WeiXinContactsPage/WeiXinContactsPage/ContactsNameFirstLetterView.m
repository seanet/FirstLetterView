//
//  ContactsNameFirstLetterView.m
//  WeiXinContactsPage
//
//  Created by zhaoqihao on 12/4/14.
//  Copyright (c) 2014 zhaoqihao. All rights reserved.
//

#import "ContactsNameFirstLetterView.h"

#define CLEAR_COLOR [UIColor clearColor]

@implementation ContactsNameFirstLetterView{
    NSArray *letters;
}
@synthesize delegate=_delegate;

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    
    return self;
}

-(void)awakeFromNib{
    [self prepare];
}

-(void)prepare{
    [self setBackgroundColor:CLEAR_COLOR];
    [self.layer setCornerRadius:3];
    [self setClipsToBounds:YES];
    
    letters=[NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#", nil];
    
    CGFloat mw=[self maxWidthInLetters];
    if(self.frame.size.width<mw)
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, mw, self.frame.size.height)];
}

-(void)drawRect:(CGRect)rect{
    CGFloat space=(self.bounds.size.height-[self wholeLettersHeight]-MARGIN*2)/(letters.count-1);
    
    CGFloat coordinateX;
    CGFloat coordinateY=MARGIN;
    
    NSDictionary *attrDict=[[NSDictionary alloc]initWithObjectsAndKeys:[UIFont systemFontOfSize:LETTER_SIZE],NSFontAttributeName,[UIColor grayColor],NSForegroundColorAttributeName, nil];
    
    for(NSString *l in letters){
        CGRect lr=[self letterRect:l];
        coordinateX=(self.bounds.size.width-lr.size.width)/2;
        [l drawInRect:CGRectMake(coordinateX, coordinateY, lr.size.width, lr.size.height) withAttributes:attrDict];
        
        coordinateY+=lr.size.height+space;
    }
}

-(CGFloat)wholeLettersHeight{
    CGFloat h=0;
    for(NSString *l in letters){
        h+=[self letterRect:l].size.height;
    }
    
    return h;
}

-(CGFloat)maxWidthInLetters{
    CGFloat w=0;
    for (NSString *l in letters) {
        CGFloat temp=[self letterRect:l].size.width;
        if(temp>w) w=temp;
    }
    
    return w;
}

-(CGRect)letterRect:(NSString *)letter{
    NSDictionary *attrDic=[[NSDictionary alloc]initWithObjectsAndKeys:[UIFont systemFontOfSize:LETTER_SIZE],NSFontAttributeName, nil];
    CGRect letterRect=[letter boundingRectWithSize:CGSizeMake(INTMAX_MAX, INTMAX_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrDic context:nil];
    
    return letterRect;
}

-(NSString *)letterForLocation:(CGPoint)location{
    NSString *l;
    
    CGFloat length=self.bounds.size.height/letters.count;
    int r=floor(location.y/length);
    
    if(r>=0&&r<letters.count) l=[letters objectAtIndex:r];
    else if(r<0) l=[letters objectAtIndex:0];
    else if(r>=letters.count) l=[letters objectAtIndex:letters.count-1];
    
    return l;
}

#pragma mark - touch events

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *t in touches){
        self.backgroundColor=SELECTED_COLOR;
        CGPoint location=[t locationInView:self];
        [self.delegate choiceLetter:[self letterForLocation:location]];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *t in touches){
        CGPoint location=[t locationInView:self];
        [self.delegate choiceLetter:[self letterForLocation:location]];
    }
}

-(void)endTouches:(NSSet *)touches{
    self.backgroundColor=CLEAR_COLOR;
    [self.delegate choiceLetter:nil];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self endTouches:touches];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [self endTouches:touches];
}

@end
