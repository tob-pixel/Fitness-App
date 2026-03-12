//
//  ChartPeriod.swift
//  FitnessApp
//
//  Created by visortix on 16.02.2026.
//

import Foundation

enum ChartPeriod: String, Identifiable, CaseIterable {
    
    // MARK: Id
    /// String raw value id
    var id: String { self.rawValue }
    
    // MARK: Period cases
    case week, month, year, max
        
    // MARK: - Time in the period
    var days: Int {
        switch self {
        case .week:  7
        case .month: Calendar.current.daysInMonth
        case .year:  Calendar.current.daysInYear
        case .max:   365*3
        }
    }
    var seconds: Int { days.daysToSeconds }
    
    // MARK: - Extreme date points
    var start: Date { .periodAgo(period: self).startOfDay }
    var end: Date { .now.startOfDay }
}

