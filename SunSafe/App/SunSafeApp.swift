//
//  SunSafeApp.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import SwiftUI
import CodableExtensions

@main
struct SunSafeApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AlarmPageView()
//                    .preferredColorScheme(.dark)
            }
            
//            Button {
//                
////                CalendarPageView()
//                
//            } label: {
//                
//                Image(systemName: "calendar")
//                    .foregroundColor(Color("yellow"))
//                    .frame(width: 30, height: 30, alignment: .topLeading)
//                    .font(.system(size: 30, weight: .regular))
//                    .padding(.top, 15)
//                    .padding(.trailing)
//                
//            }
            
            
        }.onChange(of: scenePhase, perform: {phase in
            switch phase {
            case .background:
                try? User.shared.history.save(in: "history")
            case .inactive:
                try? User.shared.history.save(in: "history")
            case .active:
                break
            @unknown default:
                break
            }
        })
    }
}
