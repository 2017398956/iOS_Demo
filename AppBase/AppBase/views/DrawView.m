//
//  DrawView.m
//  AppBase
//
//  Created by nfl on 2022/11/2.
//

#import "DrawView.h"
#import "DrawView+Ext.h"

@implementation DrawView

- (void)save{
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    //获取上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    //截屏
    [self.layer renderInContext:context];
    //获取图片
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片上下文
    UIGraphicsEndImageContext();
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}

- (void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 50, 50)];
    [path stroke];
    
    [[UIColor redColor] setFill];
    UIRectFill(self.bounds);
}

//保存图片的回调
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSString *message = @"";
    if (!error) {
        message = @"成功保存到相册";
    }else{
        message = [error description];
    }
    NSLog(@"message is %@",message);
}

- (void)testExtension{
    NSLog(@"testExtension");
}

@end
