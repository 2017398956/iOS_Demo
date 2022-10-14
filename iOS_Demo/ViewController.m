//
//  ViewController.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/11.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "NSString+Util.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)goNextView:(id)sender{
    SecondViewController *svc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 400, 300)];
    testBtn.backgroundColor = [UIColor lightGrayColor];
    [testBtn titleLabel].text = @"test";
    [testBtn addTarget:self action:@selector(goNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    // Do any additional setup after loading the view.
    NSLog(@"%@-----------%@",self.view.window, self.navigationController);
    NSString *temp;
//    temp = @"test";
    NSLog(@"temp is empty ? %@",@([temp isEmpty]));
}


@end
