//
//  Reservation.h
//  GrandHotel
//
//  Created by Matthew McClure on 9/10/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest, Room;

@interface Reservation : NSManagedObject

@property (nonatomic, retain) NSDate * arrivalDate;
@property (nonatomic, retain) NSDate * departureDate;
@property (nonatomic, retain) Guest *guest;
@property (nonatomic, retain) Room *room;

@end
