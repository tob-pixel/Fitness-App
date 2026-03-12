//
//  CalendarDayView.swift
//  FitnessApp
//
//  Created by visortix on 11.02.2026.
//

import SwiftUI

struct WeekDayView: View {
    
    let day: DayOfWeek
    let color: Color
    
    var body: some View {
        Text(dayRepresentation)
            .font(.main)
            .foregroundStyle(color)
            .background { /// - wave under the word
                if isToday {
                    WavyUnderline(color: color)
                }
            }
    }

    var dayRepresentation: String {
        let day = day.rawValue
        let string = isToday ? day : String(day.first ?? "⚠️")
        
        return string.capitalized
    }
    
    var isToday: Bool {
        day.rawValue == Date.now.dayOfWeek
    }
}

#Preview {
    WeekDayView(day: .monday, color: .black)
}
