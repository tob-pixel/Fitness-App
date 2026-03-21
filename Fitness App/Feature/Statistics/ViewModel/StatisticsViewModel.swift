//
//  StatisticsViewModel.swift
//  FitnessApp
//
//  Created by visortix on 16.02.2026.
//

import Foundation
import SwiftData

/// Class represents a view model for statistics.
/// It works with database.
@Observable final class StatisticsViewModel {
    
    private var modelContext: ModelContext
    
    // MARK: Chart and slider display state
    var selectedPeriod: ChartPeriod {
        didSet { reloadData(); updateChartState() }
    }
    var chartDisplayState: ChartDisplayState
    var sliderSelection: SliderSelection
    
    // MARK: Metrics
    var metricsProvider: MetricProvider?
    var metricsManager: MetricManager?
    var metricsSchemaManager: MetricSchemaManager?

    /// Fetched metric records by MetricIdentifiers
    var recordsByMetric: [MetricIdentifier: [MetricRecord]] = [:]
    /// MetricIdentifiers to fetch
    var activeMetrics: [MetricIdentifier] = []
    
    var noData: Bool {
        false /*recordsByMetric.allSatisfy { $0.value.isEmpty }*/ // TODO: Uncomment
    }
    
    var isLoading: Bool {
        recordsByMetric.count != activeMetrics.count
    }
        
    // MARK: - Init
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        
        let period = ChartPeriod.week
        
        self.selectedPeriod = period
        let chartState = ChartDisplayState(period: period)
        self.chartDisplayState = chartState
        self.sliderSelection = chartState.sliderSelection!
    }
}

// MARK: - State update
extension StatisticsViewModel {
    /// Function that updates the chart display state.
    private func updateChartState() {
        chartDisplayState.update(period: selectedPeriod)
    }
}

// MARK: - Metrics-related functions
extension StatisticsViewModel {
    
    /// Function that makes the setup for the instance.
    /// It inits metrics, managers and reloads the data.
    ///
    /// - Parameters:
    ///   - metrics: Metrics to fetch in the future.
    func setup(_ metrics: [MetricIdentifier]) {
        self.activeMetrics = metrics
        
        self.metricsProvider = MetricProvider(modelContext: modelContext)
        self.metricsManager = MetricManager(modelContext: modelContext, vm: self)
        self.metricsSchemaManager = MetricSchemaManager(modelContext: modelContext, vm: self)
        
        reloadData()
    }
    
    func reloadData() {
        for metric in activeMetrics {
            recordsByMetric[metric] = metricsProvider?.fetchMetrics(for: metric.stringValue, period: selectedPeriod)
        }
    }
}
