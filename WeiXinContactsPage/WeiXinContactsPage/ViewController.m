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
    __weak IBOutlet ContactsNameFirstLetterView *cf;
    __weak IBOutlet LetterLabel *ll;
    
    NSArray *letters;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
@synthesize tableView=_tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [cf setDelegate:self];
    
    letters=[NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#", nil];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [_tableView setShowsVerticalScrollIndicator:NO];
    [_tableView setShowsHorizontalScrollIndicator:NO];
}

-(void)choiceLetter:(NSString *)letter{
    if (!letter){
        ll.hidden=YES;
    }else{
        ll.hidden=NO;
        ll.letter=letter;
        
        NSInteger p=[letters indexOfObject:letter];
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:p];
        [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}

#pragma mark - tableview datasource && delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return letters.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label=[[UILabel alloc]init];
    NSString *t=[@"    "stringByAppendingString:[letters objectAtIndex:section]];
    [label setText:t];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:[UIColor darkGrayColor]];
    return label;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    [cell.textLabel setText:[letters objectAtIndex:[indexPath section]]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
