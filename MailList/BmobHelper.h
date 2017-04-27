//
//  BmobHelper.h
//  MailList
//
//  Created by 刘小坤 on 2017/4/19.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "BmobSDK/Bmob.h"


@interface BmobHelper : Bmob {
    NSMutableArray* data1;
    //static NSString* maxID;
}


+(void) setMaxID:(NSString*) string;
+(NSString*) getMaxID;
-(void) BmobDelete:(NSMutableDictionary*) dic;
-(NSMutableArray*) BmobSelect;
-(NSMutableDictionary*) BmobSelectOne:(NSString*) objectID;
-(void) BmobUpdate:(NSMutableDictionary*) dic;
-(void) BmobAdd: (NSMutableDictionary*)data;
-(NSMutableArray*) getData;
-(NSString*) getID;

@end
