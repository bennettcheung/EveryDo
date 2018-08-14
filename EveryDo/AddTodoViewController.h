//
//  AddTodoViewController.h
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@class AddTodoViewController;

@protocol AddTodoViewControllerDelegate <NSObject>
-(void) addTodoViewController:(AddTodoViewController*)controller didAddTodo:(Todo*)todo;
-(void) cancelAddTodoViewController:(AddTodoViewController*)controller;
@end

@interface AddTodoViewController : UIViewController

@property (nonatomic, weak) id <AddTodoViewControllerDelegate> delegate;

@end
