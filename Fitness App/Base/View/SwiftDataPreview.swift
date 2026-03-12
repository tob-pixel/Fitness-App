//
//  SwiftDataPreview.swift
//  FitnessApp
//
//  Created by visortix on 20.02.2026.
//

import SwiftUI
import SwiftData

struct SwiftDataPreview: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(
            for: MetricCategory.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        // Maybe load up some sample data into container.mainContext
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait<Preview.ViewTraits> {
    @MainActor static var swiftData: Self = .modifier(SwiftDataPreview())
}
