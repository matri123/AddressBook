//
//  DetailViewController.h
//  
//
//  Created by 刘小坤 on 2017/4/27.
//
//

#import <UIKit/UIKit.h>
#import "BmobHelper.h"
#import "ModalViewController.h"
#import "MBProgressHUD.h"

@interface DetailViewController : UIViewController{
    UITextField* textFieldName;
    UITextField* textFieldName1;
    UITextField* textFieldPhoneNumber;
    UITextField* textFieldPhoneNumber1;
    UIButton* buttonDelete;
}

@property (strong, nonatomic) NSMutableDictionary * dic;
@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *phontNumber;

@end
