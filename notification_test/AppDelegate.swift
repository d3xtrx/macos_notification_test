//
//  AppDelegate.swift
//  notification_test
//
//  Created by robotrip on 11/5/23.
//

import Cocoa
import UserNotifications

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        //initialize application
        UNUserNotificationCenter.current().delegate = self
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        //code to tear down application
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        return completionHandler([.list, .sound])
    }
}


