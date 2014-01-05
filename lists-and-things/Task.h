//
//  Task.h
//  lists-and-things
//
//  Created by Delia Yao on 14-01-04.
//  Copyright (c) 2014 Delia Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject <NSCoding>

@property (retain, readwrite) NSString* name;
@property (assign, readwrite) BOOL completed;

@end
