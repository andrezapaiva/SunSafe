//
//  AlarmModel.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation

class AlarmModel: Identifiable, Equatable, Codable {
    static func == (lhs: AlarmModel, rhs: AlarmModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: UUID = UUID()
    var time: Date = Date()
    var enabled: Bool = false
}
