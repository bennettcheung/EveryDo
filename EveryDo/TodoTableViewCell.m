//
//  TodoTableViewCell.m
//  EveryDo
//
//  Created by Bennett on 2018-08-14.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "TodoTableViewCell.h"

@implementation TodoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)prepareForReuse{
    [super prepareForReuse];
    
    self.titleLabel.text = @"";
    self.descriptionLabel.text = @"";
    self.priorityLabel.text = @"";
    self.deadlineLabel.text = @"";
}

@end
