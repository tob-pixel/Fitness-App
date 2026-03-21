//
//  LinearChart+Appearance.swift
//  FitnessApp
//
//  Created by visortix on 13.02.2026.
//

import SwiftUI

extension LinearChart {
    /// Structure for Appearance constants.
    struct Appearance {
        static let color = Color("C6C6C6")
        static let gradient = LinearGradient(colors: [color, .clear], startPoint: .top, endPoint: .bottom)
    }
}
