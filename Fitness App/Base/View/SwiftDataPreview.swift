//
//  SwiftDataPreview.swift
//  FitnessApp
//
//  Created by visortix on 20.02.2026.
//

import SwiftUI
import SwiftData

/// Structure that contains the functions:
/// - makeSharedContext that returns a shared context.
/// - body that returns body some view based on the content and the context.
struct SwiftDataPreview: PreviewModifier {
    
    /// Returns a shared context
    ///
    /// - Returns: The model container.
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(
            for: MetricCategory.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        // Maybe load up some sample data into container.mainContext
        return container
    }
    
    /// Returns body some view based on the content and the context.
    ///
    /// - Parameters:
    ///   - content:The content of the data preview.
    ///   - context:The context of the data preview.
    /// - Returns: Some View.
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait<Preview.ViewTraits> {
    @MainActor static var swiftData: Self = .modifier(SwiftDataPreview())
}
