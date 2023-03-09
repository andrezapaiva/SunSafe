//
//  Extensions.swift
//  SunSafe
//
//  Created by Andreza Paiva on 08/03/23.
//

import Foundation

extension Date {
    func year(using calendar: Calendar = .current) -> Int {
        calendar.component(.year, from: self)
    }
    func month(using calendar: Calendar = .current) -> Int {
        calendar.component(.month, from: self)
    }
    
    func monthMatrix()->[[String]] {
        var result:[[String]] = []
        
        let now = Date()
        let year = now.year()
        let month = now.month()
        let range = Calendar.current.range(of: .day, in: .month, for: now)!
        let components = range.map { day -> DateComponents in
            let date = DateComponents(calendar: .current, year: year, month: month, day: day).date!
            return Calendar.current.dateComponents([.weekday, .day, .month, .year], from: date)
        }
        var newLine:[String] = []
        
        var weekDay:Int = components.first!.weekday!
        for _ in 1..<weekDay { newLine.append("_") }
        
        for element in components {
            newLine.append("\(element.day!)")
            weekDay = element.weekday!
            if weekDay == 7 {
                result.append(newLine)
                newLine.removeAll()
            }
        }
        
        for _ in weekDay..<7 { newLine.append("_") }
        result.append(newLine)
        
        return result
    }
}
