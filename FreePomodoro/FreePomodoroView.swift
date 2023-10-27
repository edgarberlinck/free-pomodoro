//
//  ContentView.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-19.
//

import SwiftUI

struct FreePomodoroView: View {
    @StateObject private var pomodoroTimer = PomodoreTimer()
    @State private var requestedDate = Date()
    let notificationHandler = NotificationHandler()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    private let width: Double = 250
    var body: some View {
        VStack {
            Text("\(pomodoroTimer.time)")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .padding()
                .frame(width: width)
//                .alert("Done!", isPresented: $pomodoroTimer.showingAlert) {
//                    // Code
//                }
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
                
                Button("Stop and Skip") {
                    pomodoroTimer.reset()
                }
                .tint(.red)
                .disabled(!pomodoroTimer.isActive)

            }
            .frame(width: width)
        }
        .onAppear() {
            notificationHandler.askPermission()
        }
        .onReceive(timer) { _ in
            pomodoroTimer.updateCountdown()
            if (pomodoroTimer.isFinished) {
                notificationHandler.sendNotification(
                    title: "Interval is Finished",
                    body: "Your interval is finished")
                pomodoroTimer.isFinished.toggle()
                pomodoroTimer.nextInterval()
            }
        }
    }
}

//#Preview {
//    FreePomodoroView()
//        .frame(width: 300, height: 300)
//}
