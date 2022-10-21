//
//  SecondViewController.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/13.
//

#import "SecondViewController.h"
#import "NSString+Helper.h"
#import "UIColor+Helper.h"
#import <AppBase/AppBase.h>
//#import <AF
@interface SecondViewController (){
    NSInteger age;
    Test *test;
}
@property(nonatomic,copy)NSString *name;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",[[NSString stringWithFormat:@"%@,%@",@"1",@"2"] UTF8String]);
    // Do any additional setup after loading the view from its nib.
//    NSString *test = @"test";
//    [test testNSString02];
//    [NSString testNSString01];
//    UIColor *red = [UIColor redColor];
//    [red testUIColor02];
//    [UIColor testUIColor01];
//    
//    [self setName:test];
//    self->age = 2;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
