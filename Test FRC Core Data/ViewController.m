//
//  ViewController.m
//  Test FRC Core Data
//
//  Created by Mac on 17.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//

#import "ViewController.h"
#import "TSDataManager.h"
#import "TSViewController.h"
#import "TSTableViewCell.h"
#import <CoreData/CoreData.h>
#import "TSTableViewController.h"

static NSString *firstName [] = {
    
    @"Paul", @"James", @"William", @"Robert", @"Jack", @"Anthony",
    @"Edward", @"Godwin", @"George", @"Myles", @"Michael", @"Randolf",
    @"George", @"Trevor", @"Peter", @"Tran", @"Lenore", @"Bud",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie",
    @"Fredda", @"Katrice"
};


static NSString *lastName [] = {
    
    @"Stevens", @"Ray", @"White", @"Bryan", @"James", @"Fletcher",
    @"Allen", @"Grant", @"Harris", @"Jordan",@"Gibson",@"Tucker",
    @"Pope", @"Ramsey", @"Allison", @"Farrah", @"Laviolette",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook",
    @"Heal", @"Sechrest", @"Roots"
};

static NSString *photo [] = {
     
     @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",@"12", @"13", @"14", @"15", @"101", @"102", @"103",@"104", @"105", @"106",@"107",@"108",@"109",@"110",@"111", @"112", @"113", @"114", @"115"
};


@interface ViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
//     [self.navigationItem setHidesBackButton:YES animated:YES]; // убирать кнопку навигационного контроллера
     
     UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(setEditing:animated:)];
     [self.navigationItem setLeftBarButtonItem:editButton];
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
     self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:233 green:214 blue:163 alpha:1];
     self.navigationController.navigationBar.titleTextAttributes =
     [NSDictionary dictionaryWithObject:[UIColor lightTextColor]
                                 forKey:NSForegroundColorAttributeName];
     
//    for (int i = 0; i < 30; i++) {
//        
//        [self createdStudent];
//    }
//    [self.managedObjectContext save:nil];
    
    NSLog(@"count = %ld", [[self allSudent] count]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Created Student

-(TSStudent *) createdStudent {
    
     TSStudent *student = [NSEntityDescription insertNewObjectForEntityForName:@"TSStudent"
                                                              inManagedObjectContext:self.managedObjectContext];
     [student setValue:firstName[arc4random_uniform(65)] forKey:@"firstName"];
     [student setValue:lastName[arc4random_uniform(65)] forKey:@"lastName"];
     [student setValue:[NSDate dateWithTimeIntervalSince1970:(60 * 60 * 24 * 365 * 15)] forKey:@"dateOfBirdth"];
     [student setValue:@(arc4random_uniform(200) / 100.f + 2) forKey:@"score"];
     [student setValue:photo[arc4random_uniform(30)] forKey:@"photo"];
     self.student = student;
     return student;
}

-(NSArray *) allSudent {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *discription = [NSEntityDescription entityForName:@"TSStudent"
                                                   inManagedObjectContext:self.managedObjectContext];
    [request setEntity:discription];
    NSError *error = nil;
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    NSArray *requestArray = [self.managedObjectContext executeFetchRequest:request
                                                                     error:&error];
    return requestArray;
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
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (TSTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}


- (void)configureCell:(TSTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
     NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
     TSStudent *student = (TSStudent *)object;
     cell.firstNameLabel.text = [NSString stringWithFormat:@"%@  %@", student.firstName, student.lastName];
     cell.photoLabel.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", student.photo]];
}


#pragma mark - Actions

- (IBAction)actionDelete:(id)sender {
    
     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Вы действительно хотите"
                                                                    message:@"удалить всех студентов?"
                                                             preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"Да"
                                                            style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                                                                 NSArray *arrayobj = [self allSudent];
                                                                 for (TSStudent *obj in arrayobj) {
                                                                      [self.managedObjectContext deleteObject:obj];
                                                                 }
                                                                 [self.managedObjectContext save:nil];
                                                            }];
     UIAlertAction *actionCencel = [UIAlertAction actionWithTitle:@"Нет"
                                                            style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                 
                                                            }];
     [alert addAction:actionYes];
     [alert addAction:actionCencel];
     [self presentViewController:alert animated:YES completion:^{ }];
}
- (IBAction)actionAddStudents:(id)sender {
     
     TSTableViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TSTableViewController"];
     [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
         NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
         [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
         NSError *error = nil;
         if (![context save:&error]) {
              NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
              abort();
         }
    }
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
     
     [super setEditing:editing animated:animated];
     [self.tableView setEditing:editing animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {

     return NO;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
//     TSTableViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TSTableViewController"];
//     UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:controller];
//     [self presentViewController:nv animated:YES completion:nil];
//     [self.navigationController pushViewController:controller animated:YES];
//     [self.navigationController presentViewController:controller animated:YES completion:^{ }];
}



#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
     if (_fetchedResultsController != nil) {
          return _fetchedResultsController;
     }
     
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"TSStudent" inManagedObjectContext:self.managedObjectContext];
     [fetchRequest setEntity:entity];
     [fetchRequest setFetchBatchSize:20];
     NSSortDescriptor *sortDescriptorFirstName = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
     NSSortDescriptor *sortDescriptorLastName = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
     [fetchRequest setSortDescriptors:@[sortDescriptorFirstName, sortDescriptorLastName]];
     NSFetchedResultsController *aFetchedResultsController =
     [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                         managedObjectContext:self.managedObjectContext
                                           sectionNameKeyPath:nil
                                                    cacheName:nil];
     aFetchedResultsController.delegate = self;
     self.fetchedResultsController = aFetchedResultsController;
     
     NSError *error = nil;
     if (![self.fetchedResultsController performFetch:&error]) {
          NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
          abort();
     }
     
     return _fetchedResultsController;
}


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
     [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
     UITableView *tableView = self.tableView;
 
     switch(type) {
          case NSFetchedResultsChangeInsert:
               [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
               break;
               
          case NSFetchedResultsChangeDelete:
               [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
               break;
               
          case NSFetchedResultsChangeUpdate:
               [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
               break;
               
          case NSFetchedResultsChangeMove:
               [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
               [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
               break;
     }
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type
{
     switch(type) {
          case NSFetchedResultsChangeInsert:
               [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
               break;
               
          case NSFetchedResultsChangeDelete:
               [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
               break;
               
          default:
               return;
     }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
     [self.tableView endUpdates];
}

@end
