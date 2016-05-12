//
//  TSTableViewController.h
//  Test FRC Core Data
//
//  Created by Mac on 25.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *tirstNamelabel;
@property (weak, nonatomic) IBOutlet UITextField *lastNamelabel;
@property (weak, nonatomic) IBOutlet UITextField *scoreNamelabel;
@property (weak, nonatomic) IBOutlet UITextField *dataOfBirdthNamelabel;

- (IBAction)actionSave:(id)sender;

@end
