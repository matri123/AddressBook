//
//  MainAddViewController.m
//  MailList
//
//  Created by 刘小坤 on 2017/4/26.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import "MainAddViewController.h"

@interface MainAddViewController ()

@end

@implementation MainAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(add:)];
    
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    textFieldName1 = [[UITextField alloc] initWithFrame:CGRectMake(0, height / 6, width / 2, height / 7)];
    textFieldName1.userInteractionEnabled = NO;
    textFieldName1.placeholder = @"姓名";
    [textFieldName1 setValue:[UIColor blackColor]
                  forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldName1];
    
    textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(width / 2, height / 6, width / 2, height / 7)];
    textFieldName.userInteractionEnabled = YES;
    textFieldName.layer.borderWidth = 1.0;
    textFieldName.layer.borderColor = [[UIColor blackColor] CGColor];
    //textFieldName.placeholder = self.name;
    [textFieldName setValue:[UIColor blackColor]
                 forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldName];
    
    textFieldPhoneNumber1 = [[UITextField alloc] initWithFrame:CGRectMake(0, height / 2, width / 2, height / 7)];
    textFieldPhoneNumber1.userInteractionEnabled = NO;
    textFieldPhoneNumber1.placeholder = @"电话";
    [textFieldPhoneNumber1 setValue:[UIColor blackColor]
                         forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldPhoneNumber1];
    
    textFieldPhoneNumber = [[UITextField alloc] initWithFrame:CGRectMake(width / 2, height / 2, width / 2, height / 7)];
    textFieldPhoneNumber.userInteractionEnabled = YES;
    textFieldPhoneNumber.keyboardType = UIKeyboardTypeNumberPad;
    textFieldPhoneNumber.layer.borderWidth = 1.0;
    textFieldPhoneNumber.layer.borderColor = [[UIColor blackColor] CGColor];
    //textFieldPhoneNumber.placeholder = self.phontNumber;
    [textFieldPhoneNumber setValue:[UIColor blackColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldPhoneNumber];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) add:(id) sender{
    if([textFieldName.text compare:@""]==0 || [textFieldPhoneNumber.text compare:@""]==0){
        
    }
    else {
        NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
        NSString *name = textFieldName.text;
        NSString *phoneNumber = textFieldPhoneNumber.text;
        [dic setValue:name forKey:@"name"];
        [dic setValue:phoneNumber forKey:@"PhoneNumber"];
        BmobHelper* helper = [[BmobHelper alloc] init];
        [helper BmobAdd:dic];
        [self.navigationController popViewControllerAnimated:true];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
