//
//  MyMacro.h
//  AppBase
//
//  Created by nfl on 2023/11/9.
//

#ifndef MyMacro_h
#define MyMacro_h

#define testMacro(name) +(instancetype)makeNew;\
+(instancetype)shared##name;

#define relizeTestMacroWithCallback(name , block) \
static id _instance;\
static bool _makeNewInstance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    if(_makeNewInstance){\
        _instance = [super allocWithZone:zone];\
    }else{\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken\
                      , ^{\
            _instance = [super allocWithZone:zone];\
        });\
    }\
    return _instance;\
}\
- (instancetype)init{\
    if(_makeNewInstance){\
        _instance = [super init];\
    }else{\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken\
                      , ^{\
            _instance = [super init];\
            block();\
        });\
    }\
    return _instance;\
}\
+ (instancetype)makeNew{\
    _makeNewInstance = TRUE;\
    return [[self alloc] init];\
}\
+ (instancetype)shared##name{\
    if(_makeNewInstance){\
    }else{\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
        _instance = [[self alloc] init];\
        });\
    }\
    return _instance;\
}


#define relizeTestMacro(name) relizeTestMacroWithCallback(name, ^{})


#endif /* MyMacro_h */
