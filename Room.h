//
//  Room.h
//  GrandHotel
//
//  Created by Matthew McClure on 9/10/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hotel, Reservation;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) Hotel *hotel;
@property (nonatomic, retain) NSSet *reservations;

@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addReservationsObject:(Reservation *)value;
- (void)removeReservationsObject:(Reservation *)value;
- (void)addReservations:(NSSet *)values;
- (void)removeReservations:(NSSet *)values;

@end
