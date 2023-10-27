//
//  NotificationHandler.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-27.
//

import Foundation
import UserNotifications

class NotificationHandler {
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
            success, error in
            
            if (success) {
                print("You have the permissions")
            } else if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(title: String, body: String) {
        var trigger: UNNotificationTrigger?
        
        // Notification type
        let dateComponent = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: Date())
        trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // Configure the Notification content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "intervalIsFinished"
        
        // Notification action buttons
        // TODO: Read more here https://developer.apple.com/documentation/usernotifications/handling_notifications_and_notification-related_actions
        let startNewInterval = UNNotificationAction(identifier: "startNewInterval", title: "Continue", options: [.foreground])
        let category = UNNotificationCategory(identifier: "intervalIsFinished", actions: [startNewInterval], intentIdentifiers: [], options: [])
        
        // Showing the Notification
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().setNotificationCategories([category])
        UNUserNotificationCenter.current().add(request)
    }
}
