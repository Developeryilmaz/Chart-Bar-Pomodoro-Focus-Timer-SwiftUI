//
//  ContentView.swift
//  PomodoroTimer
//
//  Created by YILMAZ ER on 25.05.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pomodoroVM: PomodoroViewModel
    var body: some View {
       HomeView()
            .environmentObject(pomodoroVM)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
