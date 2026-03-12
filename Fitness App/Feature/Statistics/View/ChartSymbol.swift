//
//  ChartSymbol.swift
//  FitnessApp
//
//  Created by visortix on 13.02.2026.
//

import SwiftUI

struct ChartSymbol: View {
    // MARK: Data In
    /// Actual visible domain
    let visibleDomain: Int
    
    // MARK: Data Owned by Me
    // Domain factor calculation properties
    let x1VisibleDomain = CGFloat(ChartPeriod.week.seconds)
    var domainFactor: CGFloat {
        let visibleDomain = CGFloat(visibleDomain)
        return (visibleDomain > x1VisibleDomain) ? (visibleDomain / x1VisibleDomain) : 1
    }
    
    /// Scale factor calculation property
    var scaleFactor: CGFloat { 0.05 / domainFactor }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Circle().foregroundStyle(.white)
            Circle().stroke(lineWidth: 40)
        }
        .scaleEffect(scaleFactor)
    }
}

#Preview {
//    ChartSymbol()
}
