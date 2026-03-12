import Foundation
import SwiftData

@Model
final class MetricType {
    @Attribute(.unique) var name: String
    var category: MetricCategory?
    @Relationship(deleteRule: .cascade, inverse: \MetricRecord.metricType) var records: [MetricRecord]
    
    init(name: String) {
        self.name = name
        self.records = []
    }
}
