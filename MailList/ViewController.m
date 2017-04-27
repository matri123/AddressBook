//
//  ViewController.m
//  MailList
//
//  Created by 刘小坤 on 2017/4/18.
//  Copyright © 2017年 matrix123. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataHelper.h"
#import "BmobHelper.h"
#import "People+CoreDataClass.h"
#import "People+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = [[UIScreen mainScreen] bounds].size;
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    UIBarButtonItem* addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButtonItem;

    
    
//    BmobHelper* helper = [[BmobHelper alloc] init];
//    //listData = [helper BmobSelect];
//    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
//        [helper BmobSelect];
//        sleep(3);
//        listData = [helper getData];
//        //NSLog(@"%@", listData);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.view addSubview:tableView];
//        });
//    });
    
//    [self.view addSubview:tableView];
    
}

- (void) add:(id)render{
    MainAddViewController* mainAddVC = [[MainAddViewController alloc] init];
    [self.navigationController pushViewController:mainAddVC animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = [indexPath row];
    NSDictionary *dict = [listData objectAtIndex:row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger selectedIndex = [indexPath row];
    NSDictionary *dict = listData[selectedIndex];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    //NSLog(@"%d", selectedIndex);
    
    detailViewController.dic = [[NSMutableDictionary alloc] initWithDictionary:dict];
    detailViewController.objectId = dict[@"objectId"];
    detailViewController.name = dict[@"name"];
    detailViewController.phontNumber = dict[@"PhoneNumber"];

    [self.navigationController pushViewController:detailViewController animated:YES];
}


- (void) viewWillAppear:(BOOL)animated{
    BmobHelper* helper = [[BmobHelper alloc] init];
    //listData = [helper BmobSelect];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [helper BmobSelect];
        sleep(5);
        listData = [helper getData];
        //NSLog(@"%@", listData);
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.view addSubview:tableView];
            //listData = [helper getData];
            //NSLog(@"%@", listData);
            [tableView reloadData];
            for(NSMutableDictionary* dic in listData){
                NSString* ID = [dic valueForKey:@"ID"];
                int temp = [ID intValue];
                temp ++;
                [BmobHelper setMaxID:[[NSString alloc] initWithFormat:@"%d", temp]];
            }
        });
    });
    //[tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
