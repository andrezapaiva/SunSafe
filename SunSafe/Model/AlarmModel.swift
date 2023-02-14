//
//  AlarmModel.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation

struct AlarmModel: Identifiable, Equatable, Codable {
    var id: UUID = UUID()
    var time: Date = Date()
    var enabled: Bool = false
}
