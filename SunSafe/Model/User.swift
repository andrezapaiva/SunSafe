//
//  User.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation
import CodableExtensions

class User: ObservableObject {
    
    // singleton
    static var shared: User = User()
    
    @Published var history: [String:HistoryItem] = (try? [String:HistoryItem].load(from: "history")) ??  [:]
    
    var lastDayInHistory:String? {  history.keys.sorted().last }
    
    func createNewDay() {
        if history[today] != nil { return }
        // else
        
        if let lastDayInHistory {
            history[today] = history[lastDayInHistory]
            history[today]?.timesApplied = 0
            return
        } // else
        
        history[today] = HistoryItem()
    }
}

extension Date {
    var yyyy_mm_dd:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        return formatter.string(from: self)
    }
}

var today:String {Date().yyyy_mm_dd}
