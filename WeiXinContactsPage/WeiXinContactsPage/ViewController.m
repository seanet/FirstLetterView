//
//  ViewController.m
//  WeiXinContactsPage
//
//  Created by lmwl123 on 12/4/14.
//  Copyright (c) 2014 zhaoqihao. All rights reserved.
//

#import "ViewController.h"
#import "LetterLabel.h"

@interface ViewController (){
    __weak LetterLabel *ll;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContactsNameFirstLetterView *c=[[ContactsNameFirstLetterView alloc]initWithFrame:CGRectMake(50, 40, 25, self.view.bounds.size.height-70)];
    [c setDelegate:self];
    [self.view addSubview:c];
    
    LetterLabel *letterLabel=[[LetterLabel alloc]initWithFrame:CGRectMake(100, 100, 0, 0)];
    letterLabel.hidden=YES;
    [self.view addSubview:letterLabel];
    
    ll=letterLabel;
}

-(void)choiceLetter:(NSString *)letter{
    if (!letter){
        ll.hidden=YES;
    }else{
        ll.hidden=NO;
        ll.letter=letter;
    }
}

@end
