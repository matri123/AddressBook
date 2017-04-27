//
//  People+CoreDataProperties.m
//  
//
//  Created by 刘小坤 on 2017/4/19.
//
//

#import "People+CoreDataProperties.h"

@implementation People (CoreDataProperties)

+ (NSFetchRequest<People *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"People"];
}

@dynamic id;
@dynamic name;
@dynamic phoneNumber;

@end
