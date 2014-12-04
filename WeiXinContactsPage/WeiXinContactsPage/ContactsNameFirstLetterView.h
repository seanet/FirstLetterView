//
//  ContactsNameFirstLetterView.h
//  WeiXinContactsPage
//
//  Created by zhaoqihao on 12/4/14.
//  Copyright (c) 2014 zhaoqihao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LETTER_SIZE 14 //the font size
#define MARGIN 2 //top and bottom margin
#define SELECTED_COLOR [UIColor colorWithWhite:0.8 alpha:0.7] //the selected background color

@protocol ChoiceLetterDelegate <NSObject>

-(void)choiceLetter:(NSString *)letter;

@end

@interface ContactsNameFirstLetterView : UIView

@property (nonatomic,weak)id<ChoiceLetterDelegate>delegate;

@end
