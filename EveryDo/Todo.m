//
//  Todo.m
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(id)initWithTitle:(NSString *)title todoDescription:(NSString *)description priorityNumber:(NSNumber *)priority{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = description;
        _priorityNumber = priority;
        _isCompleted = NO;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithTitle:@"Title" todoDescription:@"Description" priorityNumber:@1];
}

@end
