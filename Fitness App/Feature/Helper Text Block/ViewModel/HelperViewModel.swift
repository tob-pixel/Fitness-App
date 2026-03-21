//
//  HelperViewModel.swift
//  FitnessApp
//
//  Created by visortix on 12.02.2026.
//

import Foundation

/// Class that represents a view moder for the helper `View`.
@Observable class HelperViewModel {
    private(set) var summary: String = ""
    private(set) var tip: String = ""
    
    var helperText: [String] {
        if summary.isEmpty && tip.isEmpty {
            ["📭 Summary not yet available"]
        } else {
            ["ℹ️ " + summary, "💁 " + tip]
        }
    }
}
