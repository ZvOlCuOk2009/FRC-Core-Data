//
//  TSTableViewCell.m
//  Test FRC Core Data
//
//  Created by Mac on 17.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import "TSTableViewCell.h"

@implementation TSTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    self.photoLabel.layer.cornerRadius = 23;
    [self.firstNameLabel setPreferredMaxLayoutWidth:200];
}

@end
