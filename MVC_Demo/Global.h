//
//  Global.h
//  MVC_Demo
//
//  Created by Tops on 5/21/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//
#ifndef MVC_Demo_Global_h
#define MVC_Demo_Global_h
#if DEBUG
#include <libgen.h>
#define ZDebug(fmt, args...)  NSLog(@"[%s:%d] %@\n", basename(__FILE__), __LINE__, [NSString stringWithFormat:fmt, ##args])
#else
#define ZDebug(fmt, args...)  ((void)0)
#endif


#endif
