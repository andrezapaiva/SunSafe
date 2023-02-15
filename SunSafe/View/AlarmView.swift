//
//  AlarmView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import UserNotifications
import SwiftUI

struct AlarmView: View {
    @Binding var alarm:AlarmModel
    @Binding var timesApplied: Int
    
    var body: some View {
        HStack {
            DatePicker("Alarm time", selection: $alarm.time, displayedComponents: .hourAndMinute)
                .labelsHidden()
                
            Spacer()
            
            Toggle(alarm.enabled ? "" : "", isOn: $alarm.enabled)
                .onChange(of: alarm.enabled, perform: { enabled in
                    enabled ? setAlarm() : cancelAlarm()
                })
                .tint(Color("yellow"))
                .padding()
        }
        .onAppear {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                print(granted)
            }
        }
//        .navigationBarTitle("SunSafe")
    }
    
    func setAlarm() {
        print("Vai criar alarme!")
        let content = UNMutableNotificationContent()
        content.title = "SunSafe"
        content.body = "Está na hora de aplicar protetor solar e registrar o seu progresso"
        content.sound = UNNotificationSound.default//UNNotificationSound.init(named: "")

        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: alarm.time), repeats: false)

        let request = UNNotificationRequest(identifier: alarm.id.uuidString, content: content, trigger: trigger)

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
        print("Cancelou alarme!")
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.id.uuidString])
    }
}
