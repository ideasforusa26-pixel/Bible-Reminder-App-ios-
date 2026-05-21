//
// AppDelegate.swift
// Bible Reminder
//

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Request Notification Permission
        NotificationsManager.shared.requestNotificationPermission()

        // Schedule Daily Notifications
        NotificationsManager.shared.scheduleDailyNotifications()

        return true
    }
}