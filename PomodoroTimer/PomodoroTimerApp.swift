//
//  PomodoroTimerApp.swift
//  PomodoroTimer
//
//  Created by YILMAZ ER on 25.05.2023.
//

import SwiftUI

@main
struct PomodoroTimerApp: App {
    @StateObject var pomodoroVM: PomodoroViewModel = .init()
    
    // MARK: Scene Phase
    @Environment(\.scenePhase) var phase
    
    //MARK: Storing Last Time Stamp
    @State var lastActiveTimeStamp: Date = Date()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroVM)
        }
        .onChange(of: phase) { newValue in
            if pomodoroVM.isStarted {
                if newValue == .background {
                    lastActiveTimeStamp = Date()
                }
                
                if newValue == .active {
                    // MARK: Finding The Difference
                    let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                    if pomodoroVM.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                        pomodoroVM.isStarted = false
                        pomodoroVM.totalSeconds = 0
                        pomodoroVM.isFinished = true
                    } else {
                        pomodoroVM.totalSeconds -= Int(currentTimeStampDiff)
                    }
                }
            }
        }
    }
}
