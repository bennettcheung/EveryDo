//
//  TodoDetailTableViewCell.h
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIStepper *priorityStepper;

@end
