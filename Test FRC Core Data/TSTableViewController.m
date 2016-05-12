//
//  TSTableViewController.m
//  Test FRC Core Data
//
//  Created by Mac on 25.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import "TSTableViewController.h"
#import <CoreData/CoreData.h>
#import "TSDataManager.h"
#include "TSStudent.h"
#import "ViewController.h"

static NSString *photo [] = {
    
    @"10", @"11",@"12", @"13", @"14", @"15", @"16",@"17", @"18", @"19", @"110",@"111", @"112", @"113", @"114", @"115", @"116", @"117", @"118", @"119"
};


@interface TSTableViewController () <UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation TSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail student";
    self.navigationController.navigationBar.tintColor = [UIColor lightTextColor];
    
    self.tirstNamelabel.delegate = self;
    self.lastNamelabel.delegate = self;
    [self.tirstNamelabel becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSManagedObjectContext

-(NSManagedObjectContext *) managedObjectContext {
    
    if (!_managedObjectContext) {
        _managedObjectContext = [[TSDataManager sharedManager] managedObjectContext];
    }
    return _managedObjectContext;
}

#pragma mark - Actions

- (IBAction)actionSave:(id)sender {
    
    if (!([self.tirstNamelabel.text isEqualToString:@""] || [self.lastNamelabel.text isEqualToString:@""])) {
        TSStudent *student = [NSEntityDescription insertNewObjectForEntityForName:@"TSStudent"
                                                           inManagedObjectContext:self.managedObjectContext];
        [student setValue:self.tirstNamelabel.text forKey:@"firstName"];
        [student setValue:self.lastNamelabel.text forKey:@"lastName"];
        [student setValue:photo[arc4random_uniform(20)] forKey:@"photo"];
        [self.managedObjectContext save:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Пожалуйста!" message:@"Заполните все поля ввода!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Ok");
        }];
    [alert addAction:actionYes];
    [self presentViewController:alert animated:YES completion:^{ }];
    }
}


#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.tirstNamelabel) {
        
        [self.lastNamelabel becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return YES;
}


@end