//
//  Date+dayOfWeek.swift
//  FitnessApp
//
//  Created by visortix on 09.02.2026.
//

import Foundation

extension Date {
    var dayOfWeek: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).lowercased()
    }
    
    static func daysAgo(days: Int) -> Date {
        .now.advanced(by: TimeInterval(-days.daysToSeconds))
    }
    static func periodAgo(period: ChartPeriod) -> Date {
        .now.advanced(by: TimeInterval(-period.seconds))
    }
    func forward(by domain : Int) -> Date {
        self.advanced(by: TimeInterval(domain))
    }
    
    func secondsTo(date end: Date) -> Int {
        let start = self
        
        return Int(start.distance(to: end))
    }
}
