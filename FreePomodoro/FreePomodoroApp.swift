//
//  FreePomodoroApp.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-19.
//

import SwiftUI

@main
struct FreePomodoroApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
