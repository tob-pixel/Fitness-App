//
//  WavyUnderline.swift
//  FitnessApp
//
//  Created by visortix on 11.02.2026.
//

import SwiftUI

struct WavyUnderline: View {
    
    let color: Color
    let pixelsPerWave: Int
    let width: CGFloat
    let offsetFactor: CGFloat
    
    init(color: Color = .black,
         pixelsPerWave: Int = WavyUnderline.pixelsPerWave,
         width: CGFloat = WavyUnderline.width,
         offsetFactor: CGFloat = WavyUnderline.offsetFactor
    ) {
        self.color = color
        self.pixelsPerWave = pixelsPerWave
        self.width = width
        self.offsetFactor = offsetFactor
    }
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            
            WaveView(
                pixelsPerWave: WavyUnderline.pixelsPerWave,
                color: color,
                lineWidth: WavyUnderline.width)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: height * WavyUnderline.offsetFactor)
        }
        
    }
}

#Preview {
    Rectangle().frame(width: 20, height: 20)
        .background { WavyUnderline(color: .black) }
}
