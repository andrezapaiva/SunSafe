//
//  CalendarDay.swift
//  SunSafe
//
//  Created by Andreza Paiva on 07/03/23.
//
import Foundation
import SwiftUI

struct CalendarDay: View {
    var color: Color = .black
    var cornerRadius:Double = 10
    var aspectRatio:Double = 1
    var text:String = "oi"
    
    var body: some View {
    ZStack {
        RoundedRectangle(cornerRadius: cornerRadius)
            .foregroundColor(Color("yellow"))
        Text(text)
            .lineLimit(1)
    }.minimumScaleFactor(0.1)
        .aspectRatio(aspectRatio, contentMode: .fit)
        .opacity(text == "_" ? 0 : 1)
    }
}


