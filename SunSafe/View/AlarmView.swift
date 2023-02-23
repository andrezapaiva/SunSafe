//
//  AlarmView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import UserNotifications
import SwiftUI

struct AlarmView: View {
    @State var alarm: AlarmModel
    
    @Binding var timesApplied: Int
    
    var index: Int
    
    var closure: (Date, Bool, Int) -> ()
    
    @State var time: Date = Date.now
    
    @State var isEnabled: Bool = false
    
    
    var body: some View {
        HStack {
            DatePicker("Alarm time", selection: $time, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .accentColor(.black)
                .onChange(of: time) { newValue in
                    closure(time, isEnabled, index)
                }
            
            Spacer()
            
            Toggle(alarm.enabled ? "" : "", isOn: $isEnabled)
                .onChange(of: isEnabled, perform: { enabled in
                    enabled ? setAlarm() : cancelAlarm()
                    closure(time, isEnabled, index)
                })
                .tint(Color("yellow"))
                .padding()
        }
        .onAppear {
            
            time = alarm.time
            isEnabled = alarm.enabled
            
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
