//
//  AppDelegate.m
//  cleverpush-example-ios
//
//  Created by Marius Gebhardt on 01.07.19.
//  Copyright © 2019 CleverPush. All rights reserved.
//

#import "AppDelegate.h"
#import <CleverPush/CleverPush.h>
#import <CleverPushLocation/CleverPushLocation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // TODO: We can specify the Channel ID here, but do not have to. If we leave it out CleverPush tries to find it via the App's Bundle ID. The Bundle ID has to be set in the CleverPush channel settings.
    
    [CleverPush initWithLaunchOptions:launchOptions
     channelId:@"7R8nkAxtrY5wy5TsS"
             handleNotificationOpened:^(CPNotificationOpenedResult *result) {
        // NSLog(@"Received Notification with URL: %@", [result.notification valueForKey:@"url"]);
    
        // NSLog(@"CleverPush.getNotifications: %@", [CleverPush getNotifications]);
        
        if ([[[result notification] valueForKey:@"chatNotification"] boolValue]) {
            UITabBarController *tabBarController = (UITabBarController *) self.window.rootViewController;
            [tabBarController setSelectedIndex:1];
            
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:[result.notification valueForKey:@"title"]
                                                                           message:@""
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alert animated:YES completion:nil];
        }
    } handleSubscribed:^(NSString *subscriptionId) {
        NSLog(@"** handleSubscribed ** Subscribed to CleverPush with ID: %@", subscriptionId);
        
        [CleverPush getAvailableTopics:^(NSArray* channelTopics) {
            NSLog(@"CleverPush CHANNEL TOPICS Callback %@", channelTopics);
        }];
        
        [CleverPush getChannelConfig:^(NSDictionary *config) {
            NSLog(@"** CleverPush getChannelConfig Callback %@", config);
        }];
    }];
    
    [CleverPush setAutoClearBadge:NO];
    
    [CleverPushLocation init];
    [CleverPushLocation requestLocationPermission];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
