import Foundation

/// Enum that represents a category
enum Category: String, CaseIterable {
    case training = "Training"
    case physical = "Physical Metrics"
    case nutrition = "Nutrition"
}

/// Enum that represents a physical metric type
enum PhysicalMetricType: String, CaseIterable {
    case weight = "Weight"
    case sleep = "Sleep"
    
    var category: Category { .physical }
}

/// Enum that represents a nutrition metric type
enum NutritionMetricType: String, CaseIterable {
    case water = "Water"
    case protein = "Protein"
    case minerals = "Minerals"
    case vitamins = "Vitamins"
    case fiber = "Fiber"
    case carbohydrates = "Carbohydrates"
    case fats = "Fats"
    
    var category: Category { .nutrition }
}

/// Enum that represents a training metric type
enum TrainingMetricType: String, CaseIterable {
    case steelWeight = "General Condition" // TODO: sum new record's steel weights with this
    case deltoids = "Deltoids"
    case pectorals = "Pectorals"
    case latissimusDorsi = "Latissimus Dorsi"
    case trapezius = "Trapezius"
    case erectorSpinae = "Erector Spinae"
    case biceps = "Biceps"
    case triceps = "Triceps"
    case rectusAbdominis = "Rectus Abdominis"
    case obliques = "Obliques"
    case lowerBack = "Lower Back"
    case quadriceps = "Quadriceps"
    case bicepsFemoris = "Biceps Femoris"
    case gluteus = "Gluteus"
    
    var category: Category { .training }
}
