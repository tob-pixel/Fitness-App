//
//  ChartDisplayState.swift
//  FitnessApp
//
//  Created by visortix on 19.02.2026.
//

import Foundation
import Observation

@Observable
final class ChartDisplayState {
    
    // MARK: SliderSelection instance property
    var sliderSelection: SliderSelection?
    
    // MARK: Visible area properties
    var period: ChartPeriod
    var visibleDomain: Int
    
    // MARK: Scroll position (left side of the chart) property
    var scrollPosition: Date {
        didSet { sliderSelection?.update() }
    }
    
    // MARK: - Init
    
    init(period: ChartPeriod) {
        self.period = period
        let visibleDays = period.days
        self.visibleDomain = visibleDays.daysToSeconds
        self.scrollPosition = .periodAgo(period: period).startOfDay
        self.sliderSelection = SliderSelection(chartDisplayState: self)
    }

    // MARK: - Functions
    /// Updates the whole chart display state
    func update(period: ChartPeriod) {
        self.period = period
        let visibleDays = period.days
        self.visibleDomain = visibleDays.daysToSeconds
        self.scrollPosition = .periodAgo(period: period).startOfDay
    }
}
