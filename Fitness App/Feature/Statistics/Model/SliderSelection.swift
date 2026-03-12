//
//  SliderSelection.swift
//  FitnessApp
//
//  Created by visortix on 19.02.2026.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class SliderSelection {
    
    // MARK: ChartDisplayState properties
    private unowned let chartDisplayState: ChartDisplayState
    private var period: ChartPeriod { chartDisplayState.period }
        
    // MARK: Slider state
    var sliderRange: ClosedRange<Date> { period.start...period.end }
        
    var lowerThumbPosition: Double = 0.0
    var upperThumbPosition: Double = 1.0
    
    // MARK: - Init
    
    init(chartDisplayState: ChartDisplayState) {
        self.chartDisplayState = chartDisplayState
    }
    
    // MARK: - Functions
    /// Updates slider thumbs
    func update() {
        let visibleDomain = chartDisplayState.visibleDomain
        
        let scrollStartPosition = chartDisplayState.scrollPosition
        let scrollEndPosition = scrollStartPosition.forward(by: visibleDomain)
        
        lowerThumbPosition = thumbPosition(for: scrollStartPosition)
        upperThumbPosition = thumbPosition(for: scrollEndPosition)
    }
    
    /// Calculates the position based on the scroll position
    /// in the range from 0.0 to 1.0
    func thumbPosition(for scrollPosition: Date) -> Double {
        let sliderLowerBound = sliderRange.lowerBound
        
        let secondsFromLowerBoundToScrollPosition = Double(
            sliderLowerBound.secondsTo(date: scrollPosition)
        )
        let displayedSeconds = Double(period.seconds)
        
        return secondsFromLowerBoundToScrollPosition / displayedSeconds
    }
}
