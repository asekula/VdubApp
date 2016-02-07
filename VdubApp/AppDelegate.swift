//
//  AppDelegate.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let appColorRed = UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 1.0)
        let appColorRedLITE = UIColor(red: 235/255, green: 181/255, blue: 184/255, alpha:1.0)
        let appColorLightBrown = UIColor(red: 213/255, green: 207/255, blue: 207/255, alpha: 1.0)
        let appColorDarkBrown = UIColor(red: 57/255, green: 30/255, blue: 27/255, alpha: 1.0)
        
        // UIView.appearance().backgroundColor = appColorLightBrown
        
        UITabBar.appearance().tintColor = appColorLightBrown
        UITabBar.appearance().barTintColor = appColorDarkBrown
        
        UISegmentedControl.appearance().tintColor = appColorDarkBrown
        UISegmentedControl.appearance().backgroundColor = appColorLightBrown
        
        UITableViewHeaderFooterView.appearance().tintColor = appColorRedLITE
        
        UINavigationBar.appearance().barTintColor = appColorDarkBrown
        UINavigationBar.appearance().barStyle = UIBarStyle.Black
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

