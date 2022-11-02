//
//  GenericsTest.h
//  AppBase
//
//  Created by nfl on 2022/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GenericsTest<T> : NSObject

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) T data;

- (void)printGenericsType;

@end

NS_ASSUME_NONNULL_END
