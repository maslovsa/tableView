//
//  TDAppDelegate.m
//  tableData
//
//  Created by Sergey Maslov on 26.08.14.
//  Copyright (c) 2014 Sergey Maslov. All rights reserved.
//

#import "TDAppDelegate.h"
#import "TDMasterViewController.h"
#import "TDPerson.h"

@implementation TDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    TDPerson *person1 = [[TDPerson alloc] initWithName:@"Alex" andCounty:@"Ru"];
    TDPerson *person2 = [[TDPerson alloc] initWithName:@"Bob" andCounty:@"Ge"];
    TDPerson *person3 = [[TDPerson alloc] initWithName:@"Chack" andCounty:@"En"];
    TDPerson *person4 = [[TDPerson alloc] initWithName:@"Dillan" andCounty:@"US"];
    TDPerson *person5 = [[TDPerson alloc] initWithName:@"Edward" andCounty:@"US"];
    TDPerson *person6 = [[TDPerson alloc] initWithName:@"Fil" andCounty:@"US"];
    TDPerson *person7 = [[TDPerson alloc] initWithName:@"Geib" andCounty:@"En"];
    TDPerson *person8 = [[TDPerson alloc] initWithName:@"Hue" andCounty:@"US"];
    TDPerson *person9 = [[TDPerson alloc] initWithName:@"Ice" andCounty:@"US"];
    TDPerson *person10 = [[TDPerson alloc] initWithName:@"Joe" andCounty:@"En"];
    
    TDPerson *person11 = [[TDPerson alloc] initWithName:@"Alex" andCounty:@"Ru"];
    TDPerson *person12 = [[TDPerson alloc] initWithName:@"Bob" andCounty:@"Ge"];
    TDPerson *person13 = [[TDPerson alloc] initWithName:@"Chack" andCounty:@"En"];
    TDPerson *person14 = [[TDPerson alloc] initWithName:@"Dillan" andCounty:@"US"];
    TDPerson *person15 = [[TDPerson alloc] initWithName:@"Edward" andCounty:@"US"];
    TDPerson *person16 = [[TDPerson alloc] initWithName:@"Fil" andCounty:@"US"];
    TDPerson *person17 = [[TDPerson alloc] initWithName:@"Geib" andCounty:@"En"];
    TDPerson *person18 = [[TDPerson alloc] initWithName:@"Hue" andCounty:@"US"];
    TDPerson *person19 = [[TDPerson alloc] initWithName:@"Ice" andCounty:@"US"];
    TDPerson *person20 = [[TDPerson alloc] initWithName:@"Joe" andCounty:@"En"];
    NSMutableArray *persons = [NSMutableArray arrayWithObjects:person1, person2, person3, person4, person5, person6, person7, person8, person9, person10, person11, person12, person13, person14, person15, person16, person17, person18, person19, person20,nil];
    
    UINavigationController *navController = (UINavigationController *) self.window.rootViewController;
    TDMasterViewController *masterController = [navController.viewControllers objectAtIndex:0];
    masterController.persons = persons;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
