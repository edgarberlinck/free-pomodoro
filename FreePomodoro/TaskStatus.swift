//
//  TaskStatus.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-19.
//

import Foundation

enum TaskStatus: String, Codable, CaseIterable {
    case todo = "pending",
    inprogress = "In Progress",
    done = "Done"
    
    var status: String {
        switch self {
            
        case .todo:
            return "todo"
        case .inprogress:
            return "inprogress"
        case .done:
            return "done"
        }
    }
}
