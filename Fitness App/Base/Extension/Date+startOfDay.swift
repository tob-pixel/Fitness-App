//
//  Data+startOfDay.swift
//  FitnessApp
//
//  Created by visortix on 16.02.2026.
//

import Foundation

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
