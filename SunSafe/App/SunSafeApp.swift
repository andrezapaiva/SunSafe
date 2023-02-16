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
            }
        }.onChange(of: scenePhase, perform: {phase in
            switch phase {
            case .background:
                break
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
