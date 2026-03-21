//
//  MetricsManager.swift
//  FitnessApp
//
//  Created by visortix on 06.03.2026.
//

import Foundation
import SwiftData

/// Structure that represents a metric manager.
struct MetricManager {
    
    private let modelContext: ModelContext
    private let vm: StatisticsViewModel
    
    // MARK: - Init

    init(modelContext: ModelContext, vm: StatisticsViewModel) {
        self.modelContext = modelContext
        self.vm = vm
    }
    
    // MARK: - Add
    
    /// Add record without timestamp.
    ///
    /// - Parameters:
    ///   - category: category of a record.
    ///   - type: type of a record.
    ///   - value: value for a record.
    ///   - exerciseSets: sets for the record.
    func addRecord(
        category: Category,
        type: String,
        value: Double? = nil,
        exerciseSets: [ExerciseSet]? = nil
    ) {
        addRecord(timestamp: Date(), category: category, type: type, value: value, exerciseSets: exerciseSets)
    }
    
    /// Main add record function.
    ///
    /// - Parameters:
    ///   - timestamp: timestamp of a record.
    ///   - category: category of a record.
    ///   - type: type of a record.
    ///   - value: value for a record.
    ///   - exerciseSets: sets for the record.
    func addRecord(
        timestamp: Date,
        category: Category,
        type: String,
        value: Double? = nil,
        exerciseSets: [ExerciseSet]? = nil
    ) {
        guard (value != nil) || (exerciseSets != nil) else { return }
        
        let typeName = type
        let categoryName = category.rawValue
        
        // TODO: find record (type, date) - sum records (type, date, value, exSets)
        
        let newRecord = MetricRecord(timestamp: timestamp, value: value, sets: exerciseSets)
        
        vm.metricsSchemaManager?.linkType(name: typeName, categoryName: categoryName, in: newRecord)
        
        modelContext.insert(newRecord)
        vm.reloadData()
    }
    
    // MARK: - Update
    
    // MARK: - Remove
    
}
