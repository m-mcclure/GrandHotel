//
//  Guest.h
//  GrandHotel
//
//  Created by Matthew McClure on 9/8/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservation;

@interface Guest : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) Reservation *reservation;

@end
