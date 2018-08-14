//
//  Todo.h
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic, assign) NSNumber *priorityNumber;
@property (nonatomic, assign) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString*)title todoDescription:(NSString*)description priorityNumber:(NSNumber*)priority;
@end
