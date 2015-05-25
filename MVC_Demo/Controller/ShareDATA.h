//
//  ShareDATA.h
//  MVC_Demo
//
//  Created by Tops on 5/21/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "DataShareClass.h"

@interface ShareDATA : DataShareClass
{
    
}
@property(nonatomic) NSString* strName;
@property(nonatomic) NSString* strEmail;

+(NSDictionary *)JSONKeyPathsByPropertyKey;
@end

