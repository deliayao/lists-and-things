//
//  AppDelegate.h
//  lists-and-things
//
//  Created by Delia Yao on 14-01-04.
//  Copyright (c) 2014 Delia Yao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Task;
@interface AppDelegate : NSObject <NSApplicationDelegate>


@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSCollectionView *tasksCollectionView;
@property (strong) NSMutableArray* tasks;

- (IBAction)addTask:(id)sender;
- (IBAction)modifyTask:(id)sender;

- (void)addObject:(Task *)task;
- (void)insertObject:(Task *)task inTasksAtIndex:(NSUInteger)index;
- (void)removeObjectFromTasksAtIndex:(NSUInteger)index;
- (BOOL)saveToDisk;
- (void)updateUI;

@end
