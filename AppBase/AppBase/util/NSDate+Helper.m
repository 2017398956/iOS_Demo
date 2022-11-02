//
//  NSData+Helper.m
//  IVCS
//
//  Created by nfl on 2022/10/26.
//  Copyright © 2022 zealcomm user. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

- (NSString *)getDateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    return [formatter stringFromDate: self];
}

@end
