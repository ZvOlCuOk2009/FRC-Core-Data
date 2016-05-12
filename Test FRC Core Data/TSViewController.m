//
//  TSViewController.m
//  Test FRC Core Data
//
//  Created by Mac on 17.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import "TSViewController.h"
#import "TSStudent.h"
#import "ViewController.h"
#import "TSStudentTableViewCell.h"

static NSString *photo [] = {
    
    @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",@"12", @"13", @"14", @"15", @"101", @"102", @"103",@"104", @"105", @"106",@"107",@"108",@"109",@"110",@"111", @"112", @"113", @"114", @"115"
};

@interface TSViewController () <UITableViewDataSource>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation TSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)actionSave:(id)sender {
    
//    if (!([self.firstNameTextField.text isEqualToString:@""] || [self.lastNameTextField.text isEqualToString:@""])) {
//        TSStudent *student = [NSEntityDescription insertNewObjectForEntityForName:@"TSStudent"
//                                                       inManagedObjectContext:self.managedObjectContext];
//        [student setValue:self.firstNameTextField.text forKey:@"firstName"];
//        [student setValue:self.lastNameTextField.text forKey:@"lastName"];
//        //[student setValue:self.scoreTextField.text forKey:@"score"];
//        //    [student setValue:self.dateOfBirdthTextField.text forKey:@"dateOfBirdth"];
//        [student setValue:photo[arc4random_uniform(30)] forKey:@"photo"];
//        [self.managedObjectContext save:nil];
//        
////        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0]
////                                              animated:YES];
//        [self.navigationController popViewControllerAnimated:YES];
//        
//        } else {
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Пожалуйста!" message:@"Заполните все поля ввода!" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                NSLog(@"Ok");
//            }];
//        [alert addAction:actionYes];
//        [self presentViewController:alert animated:YES completion:^{ }];
//    }
}


#pragma mark - NSManagedObjectContext

-(NSManagedObjectContext *) managedObjectContext {
    
    if (!_managedObjectContext) {
        _managedObjectContext = [[TSDataManager sharedManager] managedObjectContext];
    }
    return _managedObjectContext;
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifire = @"identifire";
    
    TSStudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifire forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[TSStudentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifire];
 //       cell.firstNameLabel.text =
    }
    return cell;
}

@end
