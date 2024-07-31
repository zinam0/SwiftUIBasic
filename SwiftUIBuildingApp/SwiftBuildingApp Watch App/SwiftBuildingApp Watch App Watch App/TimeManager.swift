//
//  TimeManager.swift
//  SwiftBuildingApp Watch App Watch App
//
//  Created by 남지연 on 7/31/24.
//

import SwiftUI

class TimeManager: ObservableObject {
    @Published var currentTime: TimeInterval = 0
    private var timer: Timer?
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.currentTime += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func skipForward() {
        currentTime += 30
    }
    
    func skipBackward() {
        currentTime = max(currentTime - 30, 0)
    }
    
}
