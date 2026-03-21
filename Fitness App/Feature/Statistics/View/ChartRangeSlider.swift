//
//  ChartRangeSlider.swift
//  FitnessApp
//
//  Created by visortix on 23.02.2026.
//

import SwiftUI

/// Struct that represents a range slider view.
struct ChartRangeSlider: View {
    
    // MARK: Data In
    // Thumb position bounds
    let lowerThumbPosoition: Double
    let upperThumbPosoition: Double
    
    // MARK: Data Ownded by Me 
    /// Thumb width factor in the range from 0.0 to 1.0
    var thumbWidthFactor: Double { upperThumbPosoition - lowerThumbPosoition }
    
    var isMoved: Bool {
        let lowerThumbPosoition = round(lowerThumbPosoition * 100) / 100
        let upperThumbPosoition = round(upperThumbPosoition * 100) / 100
        return lowerThumbPosoition != 0.0 || upperThumbPosoition != 1.0
    }
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            let sliderWidth = geometry.size.width
            
            ZStack(alignment: .leading) {
                // Background
                Rectangle()
                    .foregroundStyle(ChartRangeSlider.Appearance.backgroundColor)
                
                // Thumb
                RoundedRectangle(cornerRadius: isMoved ?  ChartRangeSlider.Appearance.thumbRadius : 0)
                    .animation(.thumb, value: isMoved)
                    .foregroundStyle(ChartRangeSlider.Appearance.thumbColor)
                    .frame(width: sliderWidth * thumbWidthFactor) // Thumb width scaling
                    .offset(x: sliderWidth * lowerThumbPosoition) // Thumb placement
            }
        }
        .aspectRatio(9, contentMode: .fit)
    }
}

#Preview {
    ChartRangeSlider(lowerThumbPosoition: 0.1, upperThumbPosoition: 0.2)
}
