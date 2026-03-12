//
//  FitnessApp.swift
//  FitnessApp
//
//  Created by visortix on 08.02.2026.
//

import SwiftUI
import SwiftData

@main
struct FitnessApp: App {
    var body: some Scene {
        WindowGroup {
            Statistics(charts: [.physical(.weight)])
                .modelContainer(for: MetricCategory.self)
        }
    }
}
