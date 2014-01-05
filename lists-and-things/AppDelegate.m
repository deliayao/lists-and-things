//
//  AppDelegate.m
//  lists-and-things
//
//  Created by Delia Yao on 14-01-04.
//  Copyright (c) 2014 Delia Yao. All rights reserved.
//

#import "AppDelegate.h"
#import "Task.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // load saved tasks
    if (!(self.tasks = [NSKeyedUnarchiver unarchiveObjectWithFile:@"savedTasks"])) {
        self.tasks = [NSMutableArray array];
    }
}

- (IBAction)addTask:(id)sender {
    Task* task = [[Task alloc] init];
    task.name = [sender stringValue];
    task.completed = NO;
    
    // add and save
    [self addObject:task];
    [self saveToDisk];
}

- (IBAction)modifyTask:(id)sender {
    // save when a task is modified
    [self saveToDisk];
    [self updateUI];
}

- (void)insertObject:(Task *)task inTasksAtIndex:(NSUInteger)index {
    [self.tasks insertObject:task atIndex:index];
    
}

- (void)addObject:(Task *)task {
    [self.tasks addObject:task];
    
    // refresh view
    [self updateUI];
}

- (void)removeObjectFromTasksAtIndex:(NSUInteger)index {
    [self.tasks removeObjectAtIndex:index];
}

- (BOOL)saveToDisk {
    return [NSKeyedArchiver archiveRootObject:self.tasks toFile:@"savedTasks"];
}

- (void)updateUI {
    // sort by completion status
    NSSortDescriptor* completedDescriptor = [[NSSortDescriptor alloc] initWithKey:@"completed" ascending:YES];
    [self.tasks sortUsingDescriptors:[NSArray arrayWithObjects:completedDescriptor, nil]];
    
    // refresh view
    [self.tasksCollectionView setContent:self.tasks];
}

@end
