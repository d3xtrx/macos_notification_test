//
//  ViewController.swift
//  notification_test
//
//  Created by robotrip on 11/5/23.
//

import Foundation
import Cocoa
import UserNotifications

class ViewController: NSViewController {
    
    let un = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // additional setup
    }
    override var representedObject: Any? {
        didSet {
            //update the view, if already loaded
        }
    }
    
    @IBAction func notifyUser( sender: Any) {
        un.requestAuthorization(options: [.alert, .sound]) { (authorized, error) in
            if authorized {
                print("Authorized")
            } else if !authorized {
                print("Not authorized")
            } else {
                print(error?.localizedDescription as Any)
            }
        }
        un.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                
                content.title = "hello!"
                content.subtitle = "Checking in"
                content.body = "what up pimp"
                content.sound = UNNotificationSound.default
                
                let id = "alerterer"
                
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
                
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                self.un.add(request) { (error) in
                    if error != nil { print(error?.localizedDescription as Any)}}
            }
            }
        }
        
    }
