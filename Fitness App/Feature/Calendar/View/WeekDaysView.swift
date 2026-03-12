//
//  WeekDaysView.swift
//  FitnessApp
//
//  Created by visortix on 11.02.2026.
//

import SwiftUI

struct WeekDaysView: View {
    
    let days: [DayOfWeek]
    let highlightedDays: [DayOfWeek]
    
    var body: some View {
        ForEach(days, id: \.rawValue) { day in
            
            let color = isHighlightedDay(day: day) ? ColorPalette.training : .black
            
            WeekDayView(day: day, color: color)
        }
    }
    
    func isHighlightedDay(day: DayOfWeek) -> Bool {
        highlightedDays.contains(day)
    }
}

#Preview {
    WeekDaysView(days: DayOfWeek.allCases, highlightedDays: [.friday, .saturday])
}
