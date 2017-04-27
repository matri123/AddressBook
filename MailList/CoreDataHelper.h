//
//  CoreDataHelper.h
//  MailList
//
//  Created by 刘小坤 on 2017/4/19.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"

@interface CoreDataHelper : NSObject{
    NSManagedObjectContext* context;
}

-(int) getId;
- (void) coreDataAdd:(NSMutableDictionary*) dic;
-(NSArray*) coreDataSelect;
-(void) coreDataDelete:(NSMutableDictionary*) dic;
-(void) cordDataUpdate:(NSMutableDictionary*) dic;
-(void) initColeData;

@end
