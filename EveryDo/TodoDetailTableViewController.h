//
//  TodoDetailTableViewController.h
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"


@class TodoDetailTableViewController;

@protocol TodoDetailTableViewControllerDelegate <NSObject>
-(Todo*)TodoDetailTableViewControllerDelegateGetCurrentToDo:(TodoDetailTableViewController*)controller;
-(BOOL)TodoDetailTableViewControllerDelegateIsEditMode:(TodoDetailTableViewController*)controller;
@end

@interface TodoDetailTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITableViewRowAction *todoTableViewSection;
@property (nonatomic, strong) Todo* currentTodo;
@property (nonatomic, weak) id <TodoDetailTableViewControllerDelegate> delegate;

@end
