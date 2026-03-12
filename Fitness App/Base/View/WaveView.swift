//
//  WaveView.swift
//  FitnessApp
//
//  Created by visortix on 09.02.2026.
//

import SwiftUI

struct WaveView: View {
    
    let pixelsPerWave: Int
    let color: Color
    let lineWidth: CGFloat
    
    init(pixelsPerWave: Int = 3,
         color: Color = ColorPalette.training,
         lineWidth: CGFloat = 5,
    ) {
        self.pixelsPerWave = pixelsPerWave
        self.color = color
        self.lineWidth = lineWidth
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let count = Int(width) / pixelsPerWave
            
            waves(count)
        }
    }
    
    func waves(_ count: Int) -> some View {
        HStack(spacing: 0) {
            ForEach(0..<count, id: \.self) { _ in
               wave
            }
        }
    }
    
    var wave: some View {
        Wave()
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .foregroundStyle(color)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    WaveView(pixelsPerWave: 25)
}
