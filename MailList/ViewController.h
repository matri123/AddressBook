//
//  ViewController.h
//  MailList
//
//  Created by 刘小坤 on 2017/4/18.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BmobSDK/Bmob.h"
#import "MainAddViewController.h"
#import "DetailViewController.h"
#import "MBProgressHUD.h"

@interface ViewController : UIViewController {
    UITableView* tableView;
    NSMutableArray* listData;
}


@end

