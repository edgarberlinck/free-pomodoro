//
//  ContentView.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-19.
//

import SwiftUI

struct FreePomodoroView: View {
    @StateObject private var pomodoroTimer = PomodoreTimer()
    private let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    private let width: Double = 250
    var body: some View {
        VStack {
            Text("\(pomodoroTimer.time)")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .padding()
                .frame(width: width)
                .alert("Done!", isPresented: $pomodoroTimer.showingAlert) {
                    // Code
                }
                .background(.thinMaterial)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 4))
            Slider(value: $pomodoroTimer.minutes, in: 1...30, step: 1)
                .padding()
                .frame(width: width)
                .disabled(pomodoroTimer.isActive)
                .animation(.easeInOut, value: pomodoroTimer.minutes)
            
            HStack(spacing: 50) {
                Button("Start") {
                    pomodoroTimer.start(minutes: pomodoroTimer.minutes)
                }
                .disabled(pomodoroTimer.isActive)
                
                Button("Pause", action: pomodoroTimer.reset)
                    .tint(.red)
            }
            .frame(width: width)
        }
        .onReceive(timer) { _ in
            pomodoroTimer.updateCountdown()
        }
    }
}

//#Preview {
//    FreePomodoroView()
//        .frame(width: 300, height: 300)
//}
