//
//  AddTodoViewController.m
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "AddTodoViewController.h"
#import "Todo.h"

@interface AddTodoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIStepper *priorityStepper;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (nonatomic, strong) Todo* currentToDo;
@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentToDo = [[Todo alloc]init];
    self.priorityStepper.value = [self.currentToDo.priorityNumber doubleValue];
    self.priorityLabel.text = [self.currentToDo.priorityNumber stringValue];
    [self.descriptionTextView.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.descriptionTextView.layer setBorderWidth:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveNewTodo:(UIBarButtonItem *)sender {
    self.currentToDo.title = self.titleTextField.text;
    self.currentToDo.todoDescription = self.descriptionTextView.text;
    self.currentToDo.priorityNumber = [NSNumber numberWithDouble:self.priorityStepper.value];
    
    [self.delegate addTodoViewController:self didAddTodo:self.currentToDo];
}
- (IBAction)cancelNewTodo:(UIBarButtonItem *)sender {
    [self.delegate cancelAddTodoViewController:self];
}
- (IBAction)priorityChanged:(UIStepper *)sender {
    self.priorityLabel.text = [NSString stringWithFormat:@"%.0f", self.priorityStepper.value];
}


@end
