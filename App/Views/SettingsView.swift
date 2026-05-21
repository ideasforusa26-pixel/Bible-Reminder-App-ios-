//
// SettingsView.swift
// Bible Reminder
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("morningTime") var morningTime: Date = Date()
    @AppStorage("afternoonTime") var afternoonTime: Date = Date()
    @AppStorage("eveningTime") var eveningTime: Date = Date()

    var body: some View {
        Form {
            Section(header: Text("Notification Times")) {
                DatePicker("Morning Reminder", selection: $morningTime, displayedComponents: .hourAndMinute)
                DatePicker("Afternoon Reminder", selection: $afternoonTime, displayedComponents: .hourAndMinute)
                DatePicker("Evening Reminder", selection: $eveningTime, displayedComponents: .hourAndMinute)
            }
        }
        .navigationTitle("Settings")
        .onChange(of: morningTime) { _ in
            NotificationsManager.shared.scheduleNotification(hour: Calendar.current.component(.hour, from: morningTime),
                                                             minute: Calendar.current.component(.minute, from: morningTime),
                                                             body: "Good Morning! Spend time with God and Jesus.")
        }
        .onChange(of: afternoonTime) { _ in
            NotificationsManager.shared.scheduleNotification(hour: Calendar.current.component(.hour, from: afternoonTime),
                                                             minute: Calendar.current.component(.minute, from: afternoonTime),
                                                             body: "Daily Proverbs Study Reminder.")
        }
        .onChange(of: eveningTime) { _ in
            NotificationsManager.shared.scheduleNotification(hour: Calendar.current.component(.hour, from: eveningTime),
                                                             minute: Calendar.current.component(.minute, from: eveningTime),
                                                             body: "Wrap up the day with God and Jesus.")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}