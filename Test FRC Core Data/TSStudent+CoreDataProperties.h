//
//  TSStudent+CoreDataProperties.h
//  Test FRC Core Data
//
//  Created by Mac on 26.02.16.
//  Copyright © 2016 Tsvigun Alexandr. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TSStudent.h"

NS_ASSUME_NONNULL_BEGIN

@class TSCourse;

@interface TSStudent (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *dateOfBirdth;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *photo;
@property (nullable, nonatomic, retain) NSNumber *score;
@property (nullable, nonatomic, retain) NSSet<TSCourse *> *course;

@end

@interface TSStudent (CoreDataGeneratedAccessors)

- (void)addCourseObject:(TSCourse *)value;
- (void)removeCourseObject:(TSCourse *)value;
- (void)addCourse:(NSSet<TSCourse *> *)values;
- (void)removeCourse:(NSSet<TSCourse *> *)values;

@end

NS_ASSUME_NONNULL_END
