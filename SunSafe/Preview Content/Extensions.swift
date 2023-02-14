//
//  Extensions.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation

extension Date {
    func formatDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
