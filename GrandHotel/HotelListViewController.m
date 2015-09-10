//
//  HotelListViewController.m
//  GrandHotel
//
//  Created by Matthew McClure on 9/7/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import "HotelListViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"

@interface HotelListViewController ()

//@property NSArray *hotels;

@end

@implementation HotelListViewController


-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
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
    // Do any additional setup after loading the view.
  NSLog(@"view did loaded");
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  
  //  fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name MATCHES %@",@"Four Seasons"];
  
  //fetchRequest.predicate  = [NSPredicate predicateWithFormat:@"stars < 3"];
  
  NSError *fetchError;
  self.hotels = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
  
  NSLog(@"hotel count: %lu", (unsigned long)self.hotels.count);
  
  
  if (fetchError) {
    NSLog(@"Here is the fetchError: %@",fetchError.localizedDescription);
  }
  
  [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  
  return [self.hotels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellIdentifier = @"hotelCell";
  UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  cell.backgroundColor = [UIColor colorWithRed:249.0/255 green:237.0/255 blue:224.0/255 alpha:1.0];
  
  int dataIndex = (int) indexPath.row % [self.hotels count];
  NSString *hotelName = [self.hotels[dataIndex] name];
  Hotel *thisHotel = self.hotels[dataIndex];
  cell.textLabel.text = hotelName;
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
  NSLog(@"***%@ has: %lu rooms", thisHotel.name, thisHotel.rooms.count);
  
  NSDictionary *views = @{@"label":cell.textLabel};
  NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views];
  [cell.contentView addConstraints:constraints];
  
  constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|"
                                                        options: 0
                                                        metrics:nil
                                                          views:views];
  [cell.contentView addConstraints:constraints];
  
  return cell;
  
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//  // Calculate a height based on a cell
//  if(!self.hotelCell) {
//    self.hotelCell = [self.tableView dequeueReusableCellWithIdentifier:@"hotelCell"];
//  }
//  
//  // Configure the cell
//  int dataIndex = (int) indexPath.row % [self.hotels count];
//  self.hotelCell.textLabel.text = self.hotels[dataIndex];
//  
//  // auto layout
//  
//  NSDictionary *views = @{@"label":self.hotelCell.textLabel};
//  NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|"
//                                                                 options:0
//                                                                 metrics:nil
//                                                                   views:views];
//  [self.hotelCell.contentView addConstraints:constraints];
//  
//  constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|"
//                                                        options: 0
//                                                        metrics:nil
//                                                          views:views];
//  [self.hotelCell.contentView addConstraints:constraints];
//  
//  // Layout the cell
//  
//  [self.hotelCell layoutIfNeeded];
//  
//  // Get the height for the cell
//  
//  CGFloat height = [self.hotelCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
//  
//  // Padding of 1 point (cell separator)
//  CGFloat separatorHeight = 1;
//  
//  return height + separatorHeight;
//}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//  
//  return 140;
//  
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
