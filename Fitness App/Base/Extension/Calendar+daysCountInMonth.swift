//
//  Calendar+daysInMonth.swift
//  FitnessApp
//
//  Created by visortix on 17.02.2026.
//

import Foundation

extension Calendar {
    var daysInMonth: Int {
        self.range(of: .day, in: .month, for: Date())?.count ?? 31
    }
    var daysInYear: Int {
        self.range(of: .day, in: .year, for: Date())?.count ?? 365
    }
}
