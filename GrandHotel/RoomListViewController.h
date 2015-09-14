//
//  RoomListViewController.h
//  GrandHotel
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hotel.h"

@interface RoomListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Hotel *passedHotel;

@end
