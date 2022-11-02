//
//  TestTwo.m
//  AppBase
//
//  Created by nfl on 2022/10/24.
//

#import "TestTwo.h"
#import "Test.h"
@implementation TestTwo

relizeSingleInstance();

- (void)testName{
    Test *test = [Test shared];
    [test test:@"testName"];
}
@end
