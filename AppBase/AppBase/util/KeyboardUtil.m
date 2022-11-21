//
//  KeyboardUtil.m
//  AppBase
//
//  Created by nfl on 2022/11/18.
//

#import "KeyboardUtil.h"

@interface KeyboardUtil ()

@property (strong, nonatomic) NSArray   *names;
@property (strong, nonatomic) UIView *keyBoderHandleView;
@property (assign, nonatomic) CGFloat keyBoderHandleHeigt;

@end

@implementation KeyboardUtil

relizeSingleInstance();

- (void)handleKeyBoderAction:(id)handleView offsetY:(CGFloat)offsetY{
    if (self.keyBoderHandleView) {
        self.keyBoderHandleView = handleView;
        return;
    }
    self.keyBoderHandleView = handleView;
    __weak KeyboardUtil *weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardDidShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [weakSelf keyboardDidShowFrame:note offsetY:offsetY];
    }];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [weakSelf keyboardWillHidden:note];
    }];
}

/// 键盘出现
- (void)keyboardDidShowFrame:(NSNotification *)note offsetY:(CGFloat )offsetY{
    // 取出键盘最终的frame
    CGRect keyBoderRect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 取出键盘弹出需要花费的时间
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGFloat boundHeight = UIScreen.mainScreen.bounds.size.height;
    CGFloat viewMaxY = CGRectGetMaxY(self.keyBoderHandleView.frame) - offsetY;
    self.keyBoderHandleHeigt = viewMaxY - (boundHeight-keyBoderRect.size.height);
    if (self.keyBoderHandleHeigt <= 0) {
        return;
    }
    if (self.keyBoderHandleView.superview != nil) {
        UIView *superView = self.keyBoderHandleView.superview;
        [UIView animateWithDuration:duration animations:^{
            self.keyBoderHandleView.superview.frame = CGRectMake(superView.frame.origin.x, superView.frame.origin.y-self.keyBoderHandleHeigt, superView.bounds.size.width, superView.bounds.size.height);
        }];
    }
}

/// 键盘消失
- (void)keyboardWillHidden:(NSNotification *)note{
    // 取出键盘弹出需要花费的时间
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        UIView *superView = self.keyBoderHandleView.superview;
        self.keyBoderHandleView.superview.frame = CGRectMake(superView.frame.origin.x, superView.frame.origin.y+self.keyBoderHandleHeigt, superView.bounds.size.width, superView.bounds.size.height);
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
