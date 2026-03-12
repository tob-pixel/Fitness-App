//
//  MetricsProvider.swift
//  FitnessApp
//
//  Created by visortix on 06.03.2026.
//

import Foundation
import SwiftData

struct MetricsProvider {
    
    private let modelContext: ModelContext
    
    // MARK: - Init

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - Fetching
        
    func fetchMetrics(for metricName: String, period: ChartPeriod) -> [MetricRecord] {
        
        let endDate = Date()
        let startDate = period.start
        
        let descriptor = FetchDescriptor<MetricRecord>(
            predicate: #Predicate { record in
                record.metricType?.name == metricName &&
                record.timestamp >= startDate &&
                record.timestamp <= endDate
            },
            sortBy: [SortDescriptor(\.timestamp)]
        )
        
        do {
            return try modelContext.fetch(descriptor)
        } catch {
            print("Error fetching metrics for \(metricName): \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchType(for name: String) -> MetricType? {
        let descriptor = FetchDescriptor<MetricType>(
            predicate: #Predicate { $0.name == name }
        )
        
        return try? modelContext.fetch(descriptor).first
    }
    
    func fetchCategory(for name: String) -> MetricCategory? {
        let descriptor = FetchDescriptor<MetricCategory>(
            predicate: #Predicate { $0.name == name }
        )
        
        return try? modelContext.fetch(descriptor).first
    }
}
