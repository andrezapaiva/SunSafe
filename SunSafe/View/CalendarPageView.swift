//
//  CalendarPageView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 06/03/23.
//

import Foundation
import SwiftUI

struct CalendarPageView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        Button {
            dismiss()
            
        } label: {
            
            Image(systemName: "arrow.left.circle")
                .foregroundColor(Color("yellow"))
                .frame(width: 30, height: 30, alignment: .topLeading)
                .font(.system(size: 30, weight: .light))
                .padding(.leading)
        }
    }
}

