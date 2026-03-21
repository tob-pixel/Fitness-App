//
//  WeekCalendar.swift
//  FitnessApp
//
//  Created by visortix on 09.02.2026.
//

/// Struct that represents a calendar that contains the days of the week and the training days array.
struct WeekCalendar {
    var daysOfWeek: [DayOfWeek] = DayOfWeek.allCases
    var trainingDays: [DayOfWeek] = []
}
