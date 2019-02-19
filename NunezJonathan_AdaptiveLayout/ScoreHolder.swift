//
//  ScoreHolder.swift
//  NunezJonathan_AdaptiveLayout
//
//  Created by Jonathan Nunez on 1/29/19.
//  Copyright © 2019 Jonathan Nunez. All rights reserved.
//

import Foundation

class ScoreHolder {
    
    // Store properties
    var initials: String
    var totalMoves: Int
    var totalTime: Int
    var timeStamp: Double
    
    // Computed properties
    var totalTimeFormatted: String {
        let time = TimeInterval(totalTime)
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var timeStampFormatted: String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy H:mm:ss"
        return formatter.string(from: date)
    }
    
    // Initialize
    init(initials: String, totalMoves: Int, totalTime seconds: Int, timeStamp: Double) {
        self.initials = initials
        self.totalMoves = totalMoves
        self.totalTime = seconds
        self.timeStamp = timeStamp
    }
    
}
