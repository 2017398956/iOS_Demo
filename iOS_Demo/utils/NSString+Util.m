//
//  NSString+Util.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/14.
//

#import "NSString+Util.h"

@implementation NSString (Util)

// FIXME: 这种方式判断无效？
- (BOOL)isEmpty{
    bool isNull = [self isKindOfClass:NSString.class];
    NSLog(@"NSString+Util's self:%@",@(isNull));
    return [self isEqual:nil] || [self isEqualToString:@""];
}

@end
