//
//  Task.m
//  lists-and-things
//
//  Created by Delia Yao on 14-01-04.
//  Copyright (c) 2014 Delia Yao. All rights reserved.
//

#import "Task.h"

@implementation Task

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.completed = [aDecoder decodeBoolForKey:@"completed"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeBool:self.completed forKey:@"completed"];
}

@end
