//
//  AppDelegate.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/7/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "AppDelegate.h"
#import "HotelListViewController.h"
#import "Hotel.h"
#import "Room.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  [self seedCoreDataIfNeeded];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self.window makeKeyAndVisible];
  
  //UIColor *customColor = [[UIColor alloc] initWithRed:240.0 / 255 green:9.0 / 255 blue:142.0 / 255 alpha:1.0];

  
  HotelListViewController *hotelListViewController = [[HotelListViewController alloc] init];
  hotelListViewController.view.backgroundColor = [UIColor whiteColor];
  
  self.window.rootViewController = hotelListViewController;
  
    //NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  
  
  
  /*
  NSError *fetchError;
  NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
  
  NSLog(@"%lu",(unsigned long)results.count);
  */
  
  
  
  // Override point for customization after application launch.
  return YES;
}

-(void)seedCoreDataIfNeeded {
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  NSError *fetchError;
  NSInteger count = [self.managedObjectContext countForFetchRequest:fetchRequest error:&fetchError];
  if (count == 0) {
    //seed the database
    
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
        NSError *jsonError;
        NSDictionary *rootObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
        if (jsonError) {
          return;
        } else {
          
          for(NSDictionary *key in rootObject) {
            if ([key isEqual:@"Hotels"]) {
              NSDictionary *hotels = [rootObject objectForKey:@"Hotels"];
              //NSLog(@"this is the #of hotels from json: %lu", hotels.count);
              for (NSDictionary *hotel in hotels) {
                NSString *hotelName = [hotel objectForKey:@"name"];
                //NSLog(@"%@", hotelName);
                NSNumber *hotelStars = [hotel objectForKey:@"stars"];
                //NSLog(@"%@", hotelStars);
                Hotel *hotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
                hotel.name = hotelName;
                hotel.stars = hotelStars; 
              }

            }
          }
          
        }
    
    /*
    Hotel *hotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
    hotel.name = @"Four Seasons";
    hotel.stars = @5;
    
    Hotel *motel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
    motel.name = @"Sadness Motel";
    motel.stars = @0;
    
    Room *room1 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room1.number = @1;
    room1.hotel = hotel;
    
    Room *room2 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room2.number = @2;
    room2.hotel = hotel;
    
    Room *room3 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room3.number = @3;
    room3.hotel = hotel;
    
    
    //The Amsterdam Hilton
    Hotel *amsterdamHilton = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
    amsterdamHilton.name = @"Amsterdam Hilton";
    amsterdamHilton.stars = @4;
    //[_grandHotelArray addObject:amsterdamHilton];
    
    Room *room100 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room100.number = @100;
    room100.hotel  = amsterdamHilton;
    
    Room *room101 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room101.number = @101;
    room101.hotel  = amsterdamHilton;
    
    Room *room102 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room102.number = @102;
    room102.hotel  = amsterdamHilton;
    
    Room *room103 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room103.number = @103;
    room103.hotel  = amsterdamHilton;
    
    Room *room104 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room104.number = @104;
    room104.hotel  = amsterdamHilton;
    
    Room *room105 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room105.number = @105;
    room105.hotel  = amsterdamHilton;
    
    //The Tribeca Grand
    Hotel *tribecaGrand = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
    tribecaGrand.name = @"Tribeca Grand Hotel";
    tribecaGrand.stars = @5;
    
    Room *room501 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room501.number = @501;
    room501.hotel  = tribecaGrand;
    
    Room *room502 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room502.number = @502;
    room502.hotel  = tribecaGrand;
    
    Room *room503 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room503.number = @503;
    room503.hotel  = tribecaGrand;
    
    Room *room504 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room504.number = @504;
    room504.hotel  = tribecaGrand;
    
    //Westin Siray Bay
    Hotel *westinSirayBay = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
    westinSirayBay.name = @"Westin Siray Bay";
    westinSirayBay.stars = @4;
    
    Room *room23 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room23.number = @23;
    room23.hotel  = westinSirayBay;
    
    Room *room24 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room24.number = @24;
    room24.hotel  = westinSirayBay;
    
    Room *room25 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room25.number = @25;
    room25.hotel  = westinSirayBay;
    
    Room *room26 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
    room26.number = @26;
    room26.hotel  = westinSirayBay;
    */
    
    NSError *saveError;
    BOOL result = [self.managedObjectContext save:&saveError];
    if (!result) {
      NSLog(@" %@",saveError.localizedDescription);
    }
    
  }
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
  [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
  // The directory the application uses to store the Core Data store file. This code uses a directory named "CF.HotelManager" in the application's documents directory.
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
  // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
  if (_managedObjectModel != nil) {
    return _managedObjectModel;
  }
  NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GrandHotel" withExtension:@"momd"];
  _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
  if (_persistentStoreCoordinator != nil) {
    return _persistentStoreCoordinator;
  }
  
  // Create the coordinator and store
  
  _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
  NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"GrandHotel.sqlite"];
  NSError *error = nil;
  NSString *failureReason = @"There was an error creating or loading the application's saved data.";
  if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    // Report any error we got.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
    dict[NSLocalizedFailureReasonErrorKey] = failureReason;
    dict[NSUnderlyingErrorKey] = error;
    error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
    // Replace this with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  
  return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
  // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
  if (_managedObjectContext != nil) {
    return _managedObjectContext;
  }
  
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (!coordinator) {
    return nil;
  }
  _managedObjectContext = [[NSManagedObjectContext alloc] init];
  [_managedObjectContext setPersistentStoreCoordinator:coordinator];
  return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
  if (managedObjectContext != nil) {
    NSError *error = nil;
    if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
      // Replace this implementation with code to handle the error appropriately.
      // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();
    }
  }
}

@end
