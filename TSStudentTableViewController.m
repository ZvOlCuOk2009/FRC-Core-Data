//
//  TSStudentTableViewController.m
//  Test FRC Core Data
//
//  Created by Mac on 25.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import "TSStudentTableViewController.h"
#import "TSStudentDetailTableViewCell.h"
#import "TSDataManager.h"


@interface TSStudentTableViewController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation TSStudentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail student";
    self.navigationController.navigationBar.tintColor = [UIColor lightTextColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(114.0f / 255.0f) green:(36.0f / 255.0f) blue:(73.0f / 255.0f) alpha:1];
    
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    self.navigationItem.leftBarButtonItem = leftbtn;
    
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveUser:)];
    self.navigationItem.rightBarButtonItem = rightbtn;
    
//    self.tableView.allowsMultipleSelectionDuringEditing = YES;
//    [self.tableView setEditing:YES animated:YES];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 15;
}


- (TSStudentDetailTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    TSStudentDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[TSStudentDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.leftLabel.text = @"1000";
//        [self configureCell:cell atIndexPath:indexPath];
    }
    return cell;
}

- (void)configureCell:(TSStudentDetailTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    TSStudent *student = [self studentDataTransmission];
    cell.leftLabel.text = [NSString stringWithFormat:@"%@", student.firstName];
}

-(TSStudent *)studentDataTransmission {
    
    TSStudent *student = [NSEntityDescription insertNewObjectForEntityForName:@"TSStudent"
                                                       inManagedObjectContext:self.managedObjectContext];
    return student;
}

#pragma mark - Actions

-(void)cancelPressed:(id)sender {
    
    [[[TSDataManager sharedManager] managedObjectContext] rollback];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveUser:(id)sender {
    
    
}

@end
