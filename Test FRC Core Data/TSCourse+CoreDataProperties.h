//
//  TSCourse+CoreDataProperties.h
//  Test FRC Core Data
//
//  Created by Mac on 26.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TSCourse.h"

NS_ASSUME_NONNULL_BEGIN

@class TSCourse;

@interface TSCourse (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *subject;
@property (nullable, nonatomic, retain) NSString *teacher;
@property (nullable, nonatomic, retain) NSString *sector;
@property (nullable, nonatomic, retain) NSSet<TSStudent *> *student;

@end

@interface TSCourse (CoreDataGeneratedAccessors)

- (void)addStudentObject:(TSStudent *)value;
- (void)removeStudentObject:(TSStudent *)value;
- (void)addStudent:(NSSet<TSStudent *> *)values;
- (void)removeStudent:(NSSet<TSStudent *> *)values;

@end

NS_ASSUME_NONNULL_END
