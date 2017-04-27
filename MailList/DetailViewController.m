//
//  DetailViewController.m
//  
//
//  Created by 刘小坤 on 2017/4/27.
//
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    UIBarButtonItem* addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    textFieldName1 = [[UITextField alloc] initWithFrame:CGRectMake(0, height / 6, width / 2, height / 7)];
    textFieldName1.userInteractionEnabled = NO;
    textFieldName1.placeholder = @"姓名";
    [textFieldName1 setValue:[UIColor blackColor]
                  forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldName1];
    
    textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(width / 2, height / 6, width / 2, height / 7)];
    textFieldName.userInteractionEnabled = NO;
    textFieldName.placeholder = self.name;
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
    textFieldPhoneNumber.userInteractionEnabled = NO;
    textFieldPhoneNumber.placeholder = self.phontNumber;
    [textFieldPhoneNumber setValue:[UIColor blackColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:textFieldPhoneNumber];
    
    buttonDelete = [[UIButton alloc] initWithFrame:CGRectMake(0, height*9/14, width, height / 7)];
    buttonDelete.backgroundColor = [UIColor redColor];
    [buttonDelete setTitle:@"删除" forState:UIControlStateNormal];
    [buttonDelete addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDelete];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)add:(id)sender {
    
    ModalViewController* modalViewController = [[ModalViewController alloc] init];
    modalViewController.dic = [[NSMutableDictionary alloc] initWithDictionary:self.dic];
    modalViewController.objectId = self.objectId;
    modalViewController.name = self.name;
    modalViewController.phontNumber = self.phontNumber;
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:modalViewController];
    
    [self presentViewController:navigationController animated: TRUE completion: nil];
    
    
}

- (void)delete:(id)sender{
    BmobHelper *helper = [[BmobHelper alloc] init];
    [helper BmobDelete:self.dic];
    [self.navigationController popViewControllerAnimated:TRUE];
}

-(void) viewWillAppear:(BOOL)animated{
//    BmobHelper* helper = [[BmobHelper alloc] init];
//    NSMutableDictionary* dict = [helper BmobSelectOne:self.objectId];
//    self.name = [dict objectForKey:@"name"];
//    self.phontNumber = [dict objectForKey:@"PhoneNumber"];
//    self.dic[@"name"] = self.name;
//    self.dic[@"PhoneNumber"] = self.phontNumber;
//    textFieldName.placeholder = self.name;
//    textFieldPhoneNumber.placeholder = self.phontNumber;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        BmobHelper* helper = [[BmobHelper alloc] init];
        NSMutableDictionary* dict = [helper BmobSelectOne:self.objectId];
        sleep(3);
//        NSLog(@"aaaa%@", dict);
        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"%@", dict);
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.name = [dict objectForKey:@"name"];
            self.phontNumber = [dict objectForKey:@"PhoneNumber"];
            self.dic[@"name"] = self.name;
            self.dic[@"PhoneNumber"] = self.phontNumber;
            textFieldName.placeholder = self.name;
            textFieldPhoneNumber.placeholder = self.phontNumber;

        });
    });
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
