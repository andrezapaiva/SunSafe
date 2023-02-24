//
//  AlarmModel.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation
import UserNotifications

class AlarmModel: Identifiable, Equatable, Codable {
    static func == (lhs: AlarmModel, rhs: AlarmModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String {String(time.timeIntervalSince1970)}
    var time: Date = Date()
    var enabled: Bool = false
    
    
    func setAlarm() {
        print("Vai criar alarme!", self.id)
//        print(self.id.uuidString)
        let content = UNMutableNotificationContent()
        content.title = "SunSafe"
        content.body = "Está na hora de aplicar protetor solar e registrar o seu progresso"
        content.sound = UNNotificationSound.default//UNNotificationSound.init(named: "")

        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: self.time), repeats: false)

        let request = UNNotificationRequest(identifier: self.id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if error != nil {
                print("Error setting alarm: \(error!)")
            } else {
                print(request)
                print(Date.now)
            }
        }
    }
    
    func cancelAlarm() {
        print("Cancelou alarme!", self.id)
//        print(self.id.uuidString)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [self.id])
    }
}
