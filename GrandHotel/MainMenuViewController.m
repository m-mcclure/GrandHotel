//
//  MainMenuViewController.m
//  Hotelz
//
//  Created by Matthew McClure on 9/10/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import "AppDelegate.h"
#import "MainMenuViewController.h"
#import "HotelListViewcontroller.h"
#import "GetARoomViewController.h"
#import "ExistingReservationsViewController.h"

@interface MainMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *tableData;

@end

@implementation MainMenuViewController

- (void)loadView {
  UIView *rootView = [[UIView alloc] init];
  UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStyleGrouped];
  self.tableView = tableView;
  [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:tableView];
  
  NSDictionary *views = @{@"tableView" : tableView};
  
  NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewVerticalConstraints];
  NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewHorizontalConstraints];
  
  self.view = rootView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"H0T3LZ";
  _tableData = [NSArray arrayWithObjects:@"Browse Hotels", @"Get a Room!", @"Existing Reservations", nil];
  
  _tableView.delegate = self;
  _tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *simpleTableIdentifier = @"SimpleTableItem";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
  }
  
  cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
  
  return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  CGFloat cellHeight = tableView.frame.size.height;
  
  return cellHeight/5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  if (indexPath.row == 0) {
    HotelListViewController *hotelListVC = [[HotelListViewController alloc] init];
    [self.navigationController pushViewController:hotelListVC animated:YES];
  } else if (indexPath.row == 1) {
    GetARoomViewController *getARoomVC = [[GetARoomViewController alloc] init];
    [self.navigationController pushViewController:getARoomVC animated:YES];
  } else if (indexPath.row == 2) {
    ExistingReservationsViewController *existingReservationsVC = [[ExistingReservationsViewController alloc] init];
    [self.navigationController pushViewController:existingReservationsVC animated:YES];
  }
}

@end
