//
//  TodoTableViewCell.h
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *deadlineLabel;

@end
