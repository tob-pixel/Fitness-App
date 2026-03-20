//
//  StatisticsVM+.swift
//  FitnessApp
//
//  Created by visortix on 05.03.2026.
//

// MARK: - Adding records
extension StatisticsViewModel {
    
    /// Add physical metric record
    func addRecord(type: PhysicalMetricType, value: Double) {
        metricsManager?.addRecord(category: type.category, type: type.rawValue, value: value)
    }
    
    /// Add nutrition metric record
    func addRecord(type: NutritionMetricType, value: Double) {
        metricsManager?.addRecord(category: type.category, type: type.rawValue, value: value)
    }
    
    /// Add training metric record
    func addRecord(type: TrainingMetricType, value: Double? = nil, exerciseSets: [ExerciseSet]? = nil) {
        metricsManager?.addRecord(category: type.category, type: type.rawValue, value: value, exerciseSets: exerciseSets)
    }
    
}
