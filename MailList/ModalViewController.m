//
//  ModalViewController.m
//  MailList
//
//  Created by 刘小坤 on 2017/4/27.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    UIBarButtonItem* cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    UIBarButtonItem* saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = cancelButtonItem;
    self.navigationItem.leftBarButtonItem = saveButtonItem;
    

    
    textFieldName1 = [[UITextField alloc] initWithFrame:CGRectMake(0, height / 6, width / 2, height / 7)];
    textFieldName1.userInteractionEnabled = NO;
    textFieldName1.placeholder = @"姓名";
    [textFieldName1 setValue:[UIColor blackColor]
                  forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldName1];
    
    textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(width / 2, height / 6, width / 2, height / 7)];
    textFieldName.userInteractionEnabled = YES;
    textFieldName.text = self.name;
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
    textFieldPhoneNumber.text = self.phontNumber;
    textFieldPhoneNumber.keyboardType = UIKeyboardTypeNumberPad;
    [textFieldPhoneNumber setValue:[UIColor blackColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldPhoneNumber];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save:(id)sender {
    BmobHelper *helper = [[BmobHelper alloc] init];
    [self.dic setObject:textFieldName.text forKey:@"name"];
    [self.dic setObject:textFieldPhoneNumber.text forKey:@"PhoneNumber"];
    [helper BmobUpdate:self.dic];
    [self dismissViewControllerAnimated:TRUE completion:^{}];
}

- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:^{}];
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
