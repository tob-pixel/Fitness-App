import Foundation
import SwiftData

@Model
final class ExerciseSet {
    var setIndex: Int
    var repetitions: Int
    var weight: Double
    var record: MetricRecord?
    
    init(setIndex: Int, repetitions: Int, weight: Double) {
        self.setIndex = setIndex
        self.repetitions = repetitions
        self.weight = weight
    }
}
