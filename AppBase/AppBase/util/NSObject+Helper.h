//
//  NSObject+Helper.h
//  IVCS
//
//  Created by nfl on 2021/12/13.
//  Copyright © 2021 zealcomm user. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Helper)
- (id)performSelector:(SEL)aSel withObjects:(NSArray*)objects;
@end

NS_ASSUME_NONNULL_END
