//
//  HotelListViewController.h
//  GrandHotel
//
//  Created by Matthew McClure on 9/7/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray *hotels;
@property (strong, nonatomic) UITableViewCell *hotelCell;

@end
