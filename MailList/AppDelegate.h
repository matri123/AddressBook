//
//  AppDelegate.h
//  MailList
//
//  Created by 刘小坤 on 2017/4/18.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BmobSDK/Bmob.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

