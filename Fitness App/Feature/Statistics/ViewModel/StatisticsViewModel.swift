//
//  StatisticsViewModel.swift
//  FitnessApp
//
//  Created by visortix on 16.02.2026.
//

import Foundation
import SwiftData

@Observable final class StatisticsViewModel {
    
    private var modelContext: ModelContext
    
    // MARK: Chart and slider display state
    var selectedPeriod: ChartPeriod {
        didSet { reloadData(); updateChartState() }
    }
    var chartDisplayState: ChartDisplayState
    var sliderSelection: SliderSelection
    
    // MARK: Metrics
    var metricsProvider: MetricsProvider?
    var metricsManager: MetricsManager?
    var metricsSchemaManager: MetricsSchemaManager?

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
    private func updateChartState() {
        chartDisplayState.update(period: selectedPeriod)
    }
}

// MARK: - Metrics-related functions
extension StatisticsViewModel {
    
    func setup(_ metrics: [MetricIdentifier]) {
        self.activeMetrics = metrics
        
        self.metricsProvider = MetricsProvider(modelContext: modelContext)
        self.metricsManager = MetricsManager(modelContext: modelContext, vm: self)
        self.metricsSchemaManager = MetricsSchemaManager(modelContext: modelContext, vm: self)
        
        reloadData()
    }
    
    func reloadData() {
        for metric in activeMetrics {
            recordsByMetric[metric] = metricsProvider?.fetchMetrics(for: metric.stringValue, period: selectedPeriod)
        }
    }
}
