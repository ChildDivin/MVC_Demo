//
//  ShareDATA.m
//  MVC_Demo
//
//  Created by Tops on 5/21/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ShareDATA.h"

@implementation ShareDATA

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    
    return @{
             @"strName" : @"full_name",
             @"strEmail" : @"email"
             };
}
@end
