//
// NotificationsManager.swift
// Bible Reminder
//

import Foundation
import UserNotifications

class NotificationsManager {
    static let shared = NotificationsManager()

    private init() {}

    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            } else {
                print("Notification permission granted: \(granted)")
            }
        }
    }

    func scheduleDailyNotifications() {
        let times = [(5, 0, "Good Morning! Spend time with God and Jesus."),
                     (14, 0, "Daily Proverbs Study Reminder."),
                     (23, 0, "Wrap up the day with God and Jesus.")]

        for (hour, minute, message) in times {
            scheduleNotification(hour: hour, minute: minute, body: message)
        }
    }

    private func scheduleNotification(hour: Int, minute: Int, body: String) {
        let center = UNUserNotificationCenter.current()

        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Bible Reminder"
        content.body = body
        content.sound = .default

        // Set trigger time
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        // Create notification request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}