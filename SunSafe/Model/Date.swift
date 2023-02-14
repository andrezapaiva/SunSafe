//
//  DateView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation
import SwiftUI


struct DateView {
    
    @State var progressValue: Float = 0.0
    
    let string = "31/01/2023"
    let date: Date = Date()
    var today: String {
        return date.formatDate(format: "EEE d, MMM")
    }
    
    let dateFormatStyle: Date.FormatStyle = {
        var style = Date.FormatStyle.dateTime.weekday(.abbreviated).day().month(.abbreviated)
        style.capitalizationContext = .beginningOfSentence
        return style
    }()
}
