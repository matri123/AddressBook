//
//  BmobHelper.m
//  MailList
//
//  Created by 刘小坤 on 2017/4/19.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import "BmobHelper.h"

@implementation BmobHelper

static NSString* maxID = @"1";

-(void) BmobDelete:(NSMutableDictionary*) dic {
    NSString* string = [dic objectForKey:@"objectId"];
    BmobObject* object = [BmobObject objectWithoutDataWithClassName:@"People" objectId:string];
    [object deleteInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
        
    }];
}

-(void) BmobUpdate:(NSMutableDictionary*) dic {
    NSString* string = [dic objectForKey:@"objectId"];
    BmobObject* object = [BmobObject objectWithoutDataWithClassName:@"People" objectId:string];
    [object setObject:[dic objectForKey:@"name"] forKey:@"name"];
    [object setObject:[dic objectForKey:@"PhoneNumber"] forKey:@"PhoneNumber"];
    [object updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        
    }];
}

-(NSMutableArray*) BmobSelect {
    BmobQuery* query = [BmobQuery queryWithClassName:@"People"];
    NSMutableArray* data = [[NSMutableArray alloc] init];
    query.limit = 1000;
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for(BmobObject* People in array) {
            NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
            [dic setObject:[People objectForKey:@"name"] forKey:@"name"];
            [dic setObject:[People objectForKey:@"PhoneNumber"] forKey:@"PhoneNumber"];
            [dic setObject:[People objectForKey:@"ID"] forKey:@"ID"];
            [dic setObject:[People objectId] forKey:@"objectId"];
            [data addObject:[[NSMutableDictionary alloc] initWithDictionary:dic]];
//            NSLog(@"%@", [People objectForKey:@"ID"]);
//            int currentID = [[People objectForKey:@"ID"] intValue];
//            currentID ++;
//            NSString* maxId = [[NSString alloc] initWithFormat:@"%d", currentID];
            
            //[BmobHelper setMaxID:maxId];
            //self.maxID = [[NSString alloc] initWithFormat:@"%d", currentID];
            //NSLog(@"%@", [[NSMutableDictionary alloc] initWithDictionary:dic]);
            //NSLog(@"%@",data);
        }
        data1 = [[NSMutableArray alloc] initWithArray:data];
        [query orderByAscending:@"name"];
        //NSLog(@"%@",data1);
    }];
    [query orderByAscending:@"name"];
    //[NSThread sleepForTimeInterval:2.0f];
    return data;
}

-(NSMutableDictionary*) BmobSelectOne:(NSString*) objectID {
    BmobQuery* query = [BmobQuery queryWithClassName:@"People"];
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    [query getObjectInBackgroundWithId:objectID block:^(BmobObject *object, NSError *error) {
        [dic setObject:[object objectForKey:@"name"] forKey:@"name"];
        [dic setObject:[object objectForKey:@"PhoneNumber"] forKey:@"PhoneNumber"];
        NSLog(@"%@", dic);
    }];
    return dic;
}

-(NSMutableArray*) getData {
    //NSLog(@"aaaa%@", data1);
    return data1;
}

-(void) BmobAdd: (NSMutableDictionary*)data {
    BmobObject* peopleTemp = [BmobObject objectWithClassName:@"People"];
    [peopleTemp setObject:[data valueForKey:@"name"] forKey:@"name"];
    [peopleTemp setObject:[data valueForKey:@"PhoneNumber"] forKey:@"PhoneNumber"];
    [peopleTemp setObject:[BmobHelper getMaxID] forKey:@"ID"];
    //[peopleTemp setObject:[data valueForKey:@"ID"] forKey:@"ID"];
    //[peopleTemp setObject:self.getID forKey:@"ID"];
    [peopleTemp sub_saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if(isSuccessful) {
            
        }
    }];
}

+(void) setMaxID:(NSString*) string{
    //self.maxID = string;
    //NSLog(@"%@ %@", string, [self getMaxID]);
    maxID = [[NSString alloc] initWithString:string];
}

+(NSString*) getMaxID {
    return maxID;
    //return self.maxID;
}

//BmobObject* people = [BmobObject objectWithClassName:@"People"];
//[people setObject:@"xiaoming" forKey:@"name"];
//[people setObject:@"1" forKey:@"ID"];
//[people setObject:@"123456" forKey:@"PhoneNumber"];
//[people saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//    //进行操作
//}];

@end
