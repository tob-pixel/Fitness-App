//
//  Range+days.swift
//  FitnessApp
//
//  Created by visortix on 23.02.2026.
//

import Foundation

extension ClosedRange where Bound == Date {
    var days: Int {
        let lowerBound = self.lowerBound
        let upperBound = self.upperBound
        
        return Int(lowerBound.distance(to: upperBound)).secondsToDays
    }
}
