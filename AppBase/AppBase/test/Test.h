//
//  Test.h
//  AppBase
//
//  Created by nfl on 2022/10/20.
//

#import <Foundation/Foundation.h>
#import "PrefixHeader.pch"
//#import <AFNetworking/AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN

@interface Test : NSObject

declareSingleInstance();

/**
 * 代码标签，可以放一小段代码用于提示等
 *
 * @code
 *    NSLog(@"test code");
 * @endcode
 *
 * @remark 加粗重点提示。在你用option点击查看的时候才会看到，都是跟在属性说明或者方法说明后面。
 *
 * @param str test
 */
-(void)test:(NSString *_Nullable)str;

@end

NS_ASSUME_NONNULL_END
