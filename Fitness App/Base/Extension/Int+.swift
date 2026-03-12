//
//  Int+daysToSeconds.swift
//  FitnessApp
//
//  Created by visortix on 22.02.2026.
//

extension Int {
    var daysToSeconds: Int {
        self * 24 * 3600
    }
    
    var secondsToDays: Int {
        self / 24 / 3600
    }
}
