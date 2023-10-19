//
//  AppDelegate.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-20.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        
        if let button = statusBarItem.button {
            button.title = "FP"
            statusBarItem.menu = menu.createMenu()
        }
        
    }
}
