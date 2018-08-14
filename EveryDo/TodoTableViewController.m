//
//  TodoTableViewController.m
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "TodoTableViewController.h"
#import "Todo.h"
#import "TodoTableViewCell.h"
#import "TodoTableView.h"
#import "TodoDetailTableViewController.h"

@interface TodoTableViewController ()
@property (nonatomic, strong) NSArray <Todo*> *todoArray;
@property (strong, nonatomic) IBOutlet TodoTableView *todoTableView;
@property (strong, nonatomic) Todo *currentTodo;
@property (assign, nonatomic) BOOL isEditMode;

@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _todoArray = @[
                   [[Todo alloc]initWithTitle:@"Grocery" todoDescription:@"Eggs, Bread, Tomato" priorityNumber:@1],
                   [[Todo alloc]initWithTitle:@"Gym" todoDescription:@"Benchpress, shoulderpress" priorityNumber:@2],
                   [[Todo alloc]initWithTitle:@"Homework" todoDescription:@"assignment 1, assignment2" priorityNumber:@1]
                   ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.todoArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCellID" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    Todo *todo = self.todoArray[row];
    cell.titleLabel.text = todo.title;
    cell.descriptionLabel.text = todo.todoDescription;
    cell.priorityLabel.text = [todo.priorityNumber stringValue];
    if (todo.isCompleted)
    {
        [cell.titleLabel setTextColor:[UIColor lightGrayColor]];
        [cell.descriptionLabel setTextColor:[UIColor lightGrayColor]];
        [cell.priorityLabel setTextColor:[UIColor lightGrayColor]];
    }
    else
    {
        [cell.titleLabel setTextColor:[UIColor blackColor]];
        [cell.descriptionLabel setTextColor:[UIColor blackColor]];
        [cell.priorityLabel setTextColor:[UIColor blackColor]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Segue to other view controller
    [self performSegueWithIdentifier:@"segueShowTodoDetail" sender:self];
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    Todo *todo = self.todoArray[row];
    if (todo.isCompleted)
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueShowTodoDetail"])
    {
        NSIndexPath *selectedPath = self.todoTableView.indexPathForSelectedRow;
        self.currentTodo = self.todoArray[selectedPath.row];
        
        TodoDetailTableViewController* controller = (TodoDetailTableViewController*)segue.destinationViewController;
        controller.delegate = self;
        self.isEditMode = NO;
//        NSDictionary *userInfo = @{@"currentTodo": currentTodo};
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"setCurrentTodoObject" object:self userInfo:userInfo];
    }
    else if ([segue.identifier isEqualToString:@"segueAddTodoDetail"])
    {
        TodoDetailTableViewController* controller = (TodoDetailTableViewController*)segue.destinationViewController;
        controller.delegate = self;
        
        self.isEditMode = YES;
        self.currentTodo = [[Todo alloc]init];
    }
}
// #MARK - TodoDetailTableViewControllerDelegate delegate methods
-(Todo*)TodoDetailTableViewControllerDelegateGetCurrentToDo:(id)controller{
    return self.currentTodo;
}

-(BOOL)TodoDetailTableViewControllerDelegateIsEditMode:(TodoDetailTableViewController *)controller{
    
    return self.isEditMode;
}

// MARK: - IB Action methods

- (IBAction)setTodoComplete:(UISwipeGestureRecognizer *)sender {
    
    CGPoint touch = [sender locationInView:self.tableView];

    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:touch];
    NSLog(@"swipe triggered - Path %@", indexPath);
    self.currentTodo = self.todoArray[indexPath.row];
    self.currentTodo.isCompleted = YES;
    
    [self.tableView reloadData];
}


@end
