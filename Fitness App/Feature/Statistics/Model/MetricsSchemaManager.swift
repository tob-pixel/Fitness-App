//
//  MetricsSchemaManager.swift
//  FitnessApp
//
//  Created by visortix on 06.03.2026.
//

import Foundation
import SwiftData

struct MetricsSchemaManager {
    
    private let modelContext: ModelContext
    private let vm: StatisticsViewModel
    
    // MARK: - Init

    init(modelContext: ModelContext, vm: StatisticsViewModel) {
        self.modelContext = modelContext
        self.vm = vm
    }
    
    // MARK: - Linking

    func linkType(name typeName: String, categoryName: String, in newRecord: MetricRecord) {
        // Getting the existing type
        let type = vm.metricsProvider?.fetchType(for: typeName)
        
        // Assigning
        newRecord.metricType = type ?? createNewType(name: typeName, categoryName: categoryName)
    }
        
    private func linkCategory(name categoryName: String, in newType: MetricType) {
        // Getting the category
        let category = vm.metricsProvider?.fetchCategory(for: categoryName)
        
        // Assigning
        newType.category = category ?? createNewCategory(name: categoryName)
    }
    
    // MARK: - Creating new metric items
    
    private func createNewType(name: String, categoryName: String) -> MetricType {
        let newType = MetricType(name: name)
        
        linkCategory(name: categoryName, in: newType)
        modelContext.insert(newType)
        return newType
    }
    
    private func createNewCategory(name: String) -> MetricCategory {
        let newCategory = MetricCategory(name: name)
        modelContext.insert(newCategory)
        return newCategory
    }
}
