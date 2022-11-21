//
//  ViewController.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/11.
//

#import "ViewController.h"
#import "SecondViewController.h"
//#import <IvcsClientSdk/IvcsClientSdk.h>
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
    // [drawView clearImage];
    [drawView testExtension];
    // [drawView setNeedsDisplay];
    [self.view addSubview:drawView];
    NSLog(@"%@-----------%@",self.view.window, self.navigationController);
    
    UIAlertController *alert = [[UIAlertController alloc] initWithNibName:@"dialog_custom_view_test.xib" bundle:[NSBundle mainBundle]];
    alert = [[UIAlertController alloc] init];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancelAction];
    
    // 自定义 view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0, 100, 200)];
    [view setBackgroundColor:[UIColor redColor]];
    [view sizeToFit];
    
    [alert.view addSubview:view];
    
//    [self.navigationController presentViewController:alert animated:true completion:^{
//
//    }];
    
//    [self testAlertDialog];
    
    [self testQMUIDialog];
}

- (void)testAlertDialog{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"test" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancelAction];
    
    // 自定义 view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0, 100, 200)];
    [view setBackgroundColor:[UIColor redColor]];
    [view sizeToFit];
    
    [alert.view setFrame:CGRectMake(0, 0, alert.view.bounds.size.width, alert.view.bounds.size.height *2)];
    // 下面获取 dialog 的各个图层
    UIView *subView = [alert.view subviews][0];
    // [subView setBackgroundColor:[UIColor yellowColor]];
    UIView *subView2 = [subView subviews][0];
    // 设置背景色会影响到圆角效果
    // [subView2 setBackgroundColor:[UIColor redColor]];
    UIView *subView3 = [subView2 subviews][0];
    // subView3 是带有样式的整个 dialog 的 view (如:给其设置背景色不会影响到圆角效果)
    [subView3 setBackgroundColor:[UIColor blueColor]];
    
    // actions 上部的 view
    UIView *titleAndMessageContainerSuper = [subView3 subviews][0];
    [titleAndMessageContainerSuper setBackgroundColor:[UIColor yellowColor]];
    UIView *titleAndMessageContainer = [titleAndMessageContainerSuper subviews][0];
    [titleAndMessageContainer setBackgroundColor:[UIColor orangeColor]];

    UIView *titleView = [titleAndMessageContainer subviews][1];
    [titleView setBackgroundColor:[UIColor linkColor]];
    UIView *messageView = [titleAndMessageContainer subviews][2];
    [messageView setBackgroundColor:[UIColor purpleColor]];
    UILabel *label = messageView;
    label.text = @"修改后的 message 内容";
    
    // actions
    UIView *actionsContainerSuper = [subView3 subviews][1];
    UIView *actionsContainer = [actionsContainerSuper subviews][0];
    UIView *firstAction = [actionsContainer subviews][0];
    [firstAction setBackgroundColor:[UIColor lightGrayColor]];
    // 添加自定义 view
    [subView2 addSubview:view];
    
    [self.navigationController presentViewController:alert animated:true completion:^{
        
    }];
}

- (void)testQMUIDialog{
    QMUIAlertController *alert = [QMUIAlertController alertControllerWithTitle:@"----" message:@"----" preferredStyle:QMUIAlertControllerStyleAlert];
    QMUIAlertAction *cancel = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleCancel handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
    }];
    QMUIAlertAction *sure = [QMUIAlertAction actionWithTitle:@"确定" style:QMUIAlertActionStyleDestructive handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
       
    }];
    [alert addAction:cancel];
    [alert addAction:sure];
    
    // 自定义 view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0, 100, 500)];
    [view setBackgroundColor:[UIColor redColor]];
    [alert addCustomView:view];
    NSInteger width = view.bounds.size.width;
    if(width > 0){
        NSInteger minWidth = self.view.bounds.size.width * 3/4;
        [alert setAlertContentMaximumWidth:minWidth > width? minWidth : width];
    }
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0,450, 100, 200)];
    [textField sizeToFit];
    [textField setAdjustsFontSizeToFitWidth:true];
    [textField setBackgroundColor:[UIColor blueColor]];
    [view addSubview:textField];
    
    [[KeyboardUtil shared] handleKeyBoderAction:alert.view offsetY:0];
    
    [alert showWithAnimated:NO];
    [self.navigationController presentViewController:alert animated:false completion:^{

    }];
}


@end
