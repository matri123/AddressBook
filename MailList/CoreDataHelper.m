//
//  CoreDataHelper.m
//  MailList
//
//  Created by 刘小坤 on 2017/4/19.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import "CoreDataHelper.h"
#import "CoreData/CoreData.h"
#import "People+CoreDataClass.h"
#import "People+CoreDataProperties.h"

@implementation CoreDataHelper

-(void) initColeData{
    NSManagedObjectModel* model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator* psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[doc stringByAppendingPathComponent:@"People.sqlite"]];
    NSError *error = nil;
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    if (store == nil) {
        [NSException raise:@"error" format:@"%@", [error localizedDescription]];
    }
    context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = psc;
}

- (void) coreDataAdd:(NSMutableDictionary*) dic{
    People* people = [NSEntityDescription insertNewObjectForEntityForName:@"People" inManagedObjectContext:context];
    people.name = [dic objectForKey:@"name"];
    people.phoneNumber = [dic objectForKey:@"phoneNumber"];
    int a = self.getId + 1;
    NSString* s = [NSString stringWithFormat:@"%d",a];
    people.id = s;
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"People" inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSArray* peoples = [context executeFetchRequest:request error:nil];
    
    [context save:nil];
}

-(NSArray*) coreDataSelect {
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"People" inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSArray* peoples = [context executeFetchRequest:request error:nil];
    return peoples;
}

-(void) coreDataDelete:(NSMutableDictionary*) dic {
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"People" inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSString* t = [dic objectForKey:@"id"];
    NSString* temp = [NSString stringWithFormat:@"id = %@",t];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:temp];
    request.predicate = predicate;
    NSArray* peoples = [context executeFetchRequest:request error:nil];
    for(People* people in peoples){
        [context deleteObject:people];
    }
    [context save:nil];
}

-(void) cordDataUpdate:(NSMutableDictionary*) dic {
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"People" inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSString* temp = [NSString stringWithFormat:@"id = %@", [dic objectForKey:@"id"]];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:temp];
    request.predicate = predicate;
    NSArray* peoples = [context executeFetchRequest:request error:nil];
    for(People* people in peoples){
        people.name = [dic objectForKey:@"name"];
        people.phoneNumber = [dic objectForKey:@"phoneNumber"];
    }
    [context save:nil];
}

-(int) getId {
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"People" inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSArray* peoples = [context executeFetchRequest:request error:nil];
    int ans = 0;
    for(People* people in peoples){
        int temp = [people.id intValue];
        ans = MAX(ans, temp);
    }
    return ans;
}

//BmobObject* people = [BmobObject objectWithClassName:@"People"];
//[people setObject:@"xiaoming" forKey:@"name"];
//[people setObject:@"1" forKey:@"ID"];
//[people setObject:@"123456" forKey:@"PhoneNumber"];
//[people saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//    //进行操作
//}];

@end
