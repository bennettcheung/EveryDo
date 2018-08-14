//
//  TodoDetailTableViewController.m
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "TodoDetailTableViewController.h"
#import "Todo.h"
#import "TodoDetailTableViewCell.h"

@interface TodoDetailTableViewController ()
@property (nonatomic, assign)BOOL isEditMode;
@end

@implementation TodoDetailTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    self.isEditMode = [self.delegate TodoDetailTableViewControllerDelegateIsEditMode:self];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoDetailViewCell" forIndexPath:indexPath];
    
    self.currentTodo = [self.delegate TodoDetailTableViewControllerDelegateGetCurrentToDo:self];
    cell.titleLabel.text = self.currentTodo.title;
    cell.descriptionTextView.text = self.currentTodo.todoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%@", self.currentTodo.priorityNumber];
    cell.priorityStepper.value = [self.currentTodo.priorityNumber doubleValue];
    
    if (self.isEditMode){
        cell.titleTextField.hidden = NO;
        cell.priorityStepper.hidden = NO;
        cell.titleLabel.hidden = YES;
    }
    else{
        cell.titleTextField.hidden = YES;
        cell.priorityStepper.hidden = YES;
        cell.titleLabel.hidden = NO;
    }
    
    return cell;
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
