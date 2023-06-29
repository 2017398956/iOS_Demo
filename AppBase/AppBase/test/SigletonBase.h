//
//  SigletonBase.h
//  AppBase
//
//  Created by nfl on 2022/10/24.
//

#import <Foundation/Foundation.h>
#define declareSingleInstance2(name) +(instancetype)shared##name
NS_ASSUME_NONNULL_BEGIN

@interface SigletonBase : NSObject

declareSingleInstance2();

-(void)sayHello;

@end

NS_ASSUME_NONNULL_END
