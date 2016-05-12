//
//  TSStudentDetailController.m
//  Test FRC Core Data
//
//  Created by Mac on 22.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import "TSStudentDetailController.h"
#import "TSStudent.h"

@interface TSStudentDetailController () <UITableViewDataSource, UITableViewDelegate>


@end

@implementation TSStudentDetailController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Detail student";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - TSStudentDetailControllerDelegate 

//-(TSStudent *)studentDataTransmission:(NSString *)firstName lastName:(NSString *)lastName {
//    
//    
//    return <#expression#>
//}

@end
