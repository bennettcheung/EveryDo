//
//  TodoTableViewController.h
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoDetailTableViewController.h"
#import "AddTodoViewController.h"

@interface TodoTableViewController : UITableViewController <TodoDetailTableViewControllerDelegate, AddTodoViewControllerDelegate>

@end
