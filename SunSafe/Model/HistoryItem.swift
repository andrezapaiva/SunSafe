//
//  History.swift
//  SunSafe
//
//  Created by Andreza Paiva on 15/02/23.
//

import Foundation
import Combine

class HistoryItem: Codable {
    var dailyAlarms: [AlarmModel]
    var timesApplied:Int
    
    init(dailyAlarms: [AlarmModel] = [], timesApplied: Int = 0) {
        self.dailyAlarms = dailyAlarms
        self.timesApplied = timesApplied
    }

}
