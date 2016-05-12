//
//  TSStudentTableViewCell.h
//  Test FRC Core Data
//
//  Created by Mac on 25.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSStudentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

@end
