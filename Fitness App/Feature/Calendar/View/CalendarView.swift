//
//  CalendarView.swift
//  FitnessApp
//
//  Created by visortix on 09.02.2026.
//

import SwiftUI

/// Struct that represents a calendar view.
struct CalendarView: View {
    
    @State private var vm = CalendarViewModel.init()
    
    var body: some View {
        HStack(spacing: Spacing.main) {
            WeekDaysView(days: vm.calendar.daysOfWeek, highlightedDays: vm.trainingDays)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(Padding.main)
        .background()
        .onAppear { vm.update() }
    }
}

#Preview {
    Color.blue
        .overlay {
            CalendarView()
        }
}
