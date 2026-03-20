import Foundation
import SwiftData

@Model
final class MetricRecord {
    var timestamp: Date
    var metricType: MetricType?
    
    // Base value for physical and nutritional metrics
    var value: Double?
    
    // Specific data for strength training
    // TODO: Extension: average weight, reps
    @Relationship(deleteRule: .cascade, inverse: \ExerciseSet.record) var sets: [ExerciseSet]?
    
    init(timestamp: Date, value: Double? = nil, sets: [ExerciseSet]? = nil) {
        self.timestamp = timestamp
        self.value = value
        self.sets = sets
    }
}
