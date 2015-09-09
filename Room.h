//
//  Room.h
//  GrandHotel
//
//  Created by Matthew McClure on 9/7/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hotel;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber *roomNumber;
@property (nonatomic, retain) NSNumber *bedCount;
@property (nonatomic, retain) NSNumber *priceTier;
@property (nonatomic, retain) Hotel *hotel;

@end
