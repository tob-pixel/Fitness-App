//
//  LinearChart.swift
//  FitnessApp
//
//  Created by visortix on 12.02.2026.
//

import SwiftUI
import Charts

/// Struct that represents a lenear chart view.
struct LinearChart: View {
    
    // MARK: Data In
    let data: [MetricRecord]
    
    let period: ChartPeriod
    var visibleDomain: Int
    
    // MARK: Data Shared with Me
    @Binding var scrollPosition: Date
    
    // MARK: - Init
    
    init(
        data: [MetricRecord], // TODO: Double because of average steel weight. Color
        period: ChartPeriod,
        visibleDomain: Int,
        scrollPosition: Binding<Date>
    ) {
        self.data = data
        self.period = period
        self.visibleDomain = visibleDomain
        self._scrollPosition = scrollPosition
    }
    
    // MARK: - Body
    
    var body: some View {
        Chart(data, id: \.timestamp) { data in
            // Gradient below the data line
            AreaMark(
                x: .value("Day", data.timestamp.startOfDay),
                y: .value("Value", data.value ?? 0)
            )
            .interpolationMethod(.catmullRom)
            .foregroundStyle(LinearChart.Appearance.gradient)
            
            // Data line
            LineMark(
                x: .value("Day", data.timestamp.startOfDay),
                y: .value("Value", data.value ?? 0)
            )
            .interpolationMethod(.catmullRom)
            .symbol { ChartSymbol(visibleDomain: visibleDomain) }
        }
        .foregroundStyle(LinearChart.Appearance.color)  // Data line color
        .aspectRatio(4, contentMode: .fit)              // Chart aspect ratio
        .chartXVisibleDomain(length: visibleDomain)     // Chart visible area
        .chartXScale(domain: period.start...period.end) // Chart data area
        .chartScrollableAxes(.horizontal)               // Making the chart scrollable
        .chartScrollPosition(x: $scrollPosition)        // Chart left side position
    }
}

#Preview {
    @Previewable @State var scrollPosition: Date = .now
    let data = [MetricRecord(timestamp: Date.now, value: 70),
                MetricRecord(timestamp: Date.daysAgo(days: 1), value: 60),
                MetricRecord(timestamp: Date.daysAgo(days: 2), value: 50),
                MetricRecord(timestamp: Date.daysAgo(days: 3), value: 40),
                MetricRecord(timestamp: Date.daysAgo(days: 4), value: 30),
                MetricRecord(timestamp: Date.daysAgo(days: 5), value: 20),
                MetricRecord(timestamp: Date.daysAgo(days: 6), value: 10)
            ]
    LinearChart(data: data, period: .week, visibleDomain: 223113, scrollPosition: $scrollPosition)
}
