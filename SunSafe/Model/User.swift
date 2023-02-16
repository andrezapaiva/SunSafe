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
    
    private init() {
        createNewDay()
    }
    
    @Published var history: [String:HistoryItem] = (try? [String:HistoryItem].load(from: "history")) ??  [:]
    
    var lastDayInHistory:String? {
        print("Last: ")
        print (history.keys.sorted().last ?? "Sem last!")
        return history.keys.sorted().last
    }
    
    func createNewDay() {
        if history[Date.today] != nil { return }
        // else
        
        if let lastDayInHistory {
            history[Date.today] = history[lastDayInHistory]
            history[Date.today]?.timesApplied = 0
            return
        } // else
        
        history[Date.today] = HistoryItem()
    }
}

extension Date {
    var yyyy_MM_dd:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    static var today:String {Date().yyyy_MM_dd}
}


