//
//  LetterLabel.m
//  WeiXinContactsPage
//
//  Created by zhaoqihao on 12/4/14.
//  Copyright (c) 2014 zhaoqihao. All rights reserved.
//

#import "LetterLabel.h"

@implementation LetterLabel
@synthesize letter=_letter;

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, SELF_SIZE, SELF_SIZE)];
    if(self){
        [self prepare];
    }
    
    return self;
}

-(void)awakeFromNib{
    [self prepare];
}

-(void)prepare{
    [self setBackgroundColor:BACKGROUND_COLOR];
    [self.layer setCornerRadius:7];
    [self setClipsToBounds:YES];
}

-(void)drawRect:(CGRect)rect{
    if(!_letter)
        return;
    
    NSDictionary *attrDict=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:FONT_SIZE],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    
    CGRect lr=[self letterRect:_letter];
    [_letter drawInRect:CGRectMake((self.bounds.size.width-lr.size.width)/2, (self.bounds.size.height-lr.size.height)/2, lr.size.width, lr.size.height) withAttributes:attrDict];
}

-(void)setLetter:(NSString *)letter{
    _letter=letter;
    [self setNeedsDisplay];
}

-(CGRect)letterRect:(NSString *)letter{
    NSDictionary *attrDic=[[NSDictionary alloc]initWithObjectsAndKeys:[UIFont systemFontOfSize:FONT_SIZE],NSFontAttributeName, nil];
    CGRect letterRect=[letter boundingRectWithSize:CGSizeMake(INTMAX_MAX, INTMAX_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrDic context:nil];
    
    return letterRect;
}

@end
