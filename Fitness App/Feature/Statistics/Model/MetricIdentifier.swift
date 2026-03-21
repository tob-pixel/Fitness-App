//
//  MetricIdentifier.swift
//  FitnessApp
//
//  Created by visortix on 20.02.2026.
//

import Foundation

/// Enum that represents a Metric Identifier.
enum MetricIdentifier: Hashable {
    
    // MARK: Metric group type cases
    case physical(PhysicalMetricType)
    case nutrition(NutritionMetricType)
    case training(TrainingMetricType)
    
    // MARK: - Variables
    /// Returns the name of the stored metric type 
    var stringValue: String {
        switch self {
        case .physical(let metric): return metric.rawValue
        case .nutrition(let metric): return metric.rawValue
        case .training(let metric): return metric.rawValue
        }
    }
}
