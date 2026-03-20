//
//  CalendarViewModel.swift
//  FitnessApp
//
//  Created by visortix on 09.02.2026.
//

import SwiftUI

@Observable class CalendarViewModel {
    
    var calendar = WeekCalendar.init()
    
    func update() {
        
        let currentDay = Date.now.dayOfWeek
        
        if let currentDay {
            while !isFirstCalendarDay(day: currentDay) {
                let day = daysOfWeek.removeFirst()
                daysOfWeek.append(day)
            }
        }
    }
    
    func isFirstCalendarDay(day: String) -> Bool {
        
        let firstCalendarDay = daysOfWeek.first?.rawValue
        
        if let firstCalendarDay {
            return day == firstCalendarDay
        }
        return false
    }
}

extension CalendarViewModel {
    
    var daysOfWeek: [DayOfWeek] {
        get { calendar.daysOfWeek }
        set { calendar.daysOfWeek = newValue }
    }
    
    var trainingDays: [DayOfWeek] {
        get { calendar.trainingDays }
        set { calendar.trainingDays = newValue }
    }
}
