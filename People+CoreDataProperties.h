//
//  People+CoreDataProperties.h
//  
//
//  Created by 刘小坤 on 2017/4/19.
//
//

#import "People+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface People (CoreDataProperties)

+ (NSFetchRequest<People *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phoneNumber;

@end

NS_ASSUME_NONNULL_END
