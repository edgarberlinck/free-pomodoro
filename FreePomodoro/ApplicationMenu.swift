//
//  ApplicationMenu.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-19.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let freePomodoro = FreePomodoroView()
        let topView = NSHostingController(rootView: freePomodoro)
        topView.view.frame.size = CGSize(width: 300, height: 250)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        
        return menu
    }
}
