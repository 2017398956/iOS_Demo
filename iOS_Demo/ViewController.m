//
//  ViewController.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/11.
//

#import "ViewController.h"
#import "SecondViewController.h"
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
    
    DrawView *drawView = [[DrawView alloc] initWithFrame:CGRectMake(0, 400, 400, 400)];
    drawView.backgroundColor = [UIColor lightGrayColor];
    [drawView clearImage];
    [drawView testExtension];
//    [drawView setNeedsDisplay];
    [self.view addSubview:drawView];
    // Do any additional setup after loading the view.
    NSLog(@"%@-----------%@",self.view.window, self.navigationController);
}


@end
