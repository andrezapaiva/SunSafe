//
//  GoalView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 13/02/23.
//

import Foundation
import SwiftUI

struct ProgressBar: View {
    
    /// De 0 a 1
    var progress: Float
    
    var color: Color = Color("yellow")
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth:12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees:270))
        }
    }
}
