//
//  LinearChart.swift
//  FitnessApp
//
//  Created by visortix on 12.02.2026.
//

import SwiftUI
import Charts

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
        Chart(data, id: \.timestamp) { d in
            // Gradient below the data line
            AreaMark(
                x: .value("Day", d.timestamp.startOfDay),
                y: .value("Value", d.value ?? 0)
            )
            .interpolationMethod(.catmullRom)
            .foregroundStyle(LinearChart.Appearance.gradient)
            
            // Data line
            LineMark(
                x: .value("Day", d.timestamp.startOfDay),
                y: .value("Value", d.value ?? 0)
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
//    LinearChart(data: [MetricRecord(timestamp: Date.now, value: 0)], period: .week, visibleDomain: 2)
}
