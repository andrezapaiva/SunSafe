//
//  User.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation

class User: ObservableObject {
    
    // singleton
    static var shared: User = User()
    
    @Published var alarms: [AlarmModel] = []
    @Published var history: [AlarmModel] = []

    func cria(alarm: AlarmModel) {
        var newAlarms = alarms
        newAlarms.append(alarm)
        alarms = newAlarms
    }
    
    func remove(alarm: AlarmModel) {
        alarms = alarms.filter({$0 != alarm})
    }
    
    func cumpriu(alarme: AlarmModel) {
        
    }
}
