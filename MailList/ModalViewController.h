//
//  ModalViewController.h
//  MailList
//
//  Created by 刘小坤 on 2017/4/27.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BmobHelper.h"

@interface ModalViewController : UIViewController{
    UITextField* textFieldName;
    UITextField* textFieldName1;
    UITextField* textFieldPhoneNumber;
    UITextField* textFieldPhoneNumber1;
    UIButton* buttonDelete;
    NSString* index;
}

@property (strong, nonatomic) NSMutableDictionary* dic;
@property (strong, nonatomic) NSString *objectId;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *phontNumber;

@end
