//
//  Extensions.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation

extension Date {
    
    static var dateFormatStyle: Date.FormatStyle {
        var style = Date.FormatStyle.dateTime.weekday(.wide).day().month(.wide)
        style.capitalizationContext = .beginningOfSentence
        return style
    }
    
    func formatDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
