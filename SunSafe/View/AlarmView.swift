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
                    alarm.time = time
                    closure(time, isEnabled, index)
                    alarm.cancelAlarm()
                    if isEnabled {
                        alarm.setAlarm()
                    }
                }
            
            Spacer()
            
            Toggle(alarm.enabled ? "" : "", isOn: $isEnabled)
                .onChange(of: isEnabled, perform: { enabled in
                    alarm.enabled = isEnabled
                    enabled ? alarm.setAlarm() : alarm.cancelAlarm()
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
    
   
}
