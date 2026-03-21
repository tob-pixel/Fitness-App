import Foundation
import SwiftData

/// Class for metric categories data storage.
@Model
final class MetricCategory {
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .cascade, inverse: \MetricType.category) var metrics: [MetricType]
    
    init(name: String) {
        self.name = name
        self.metrics = []
    }
}
