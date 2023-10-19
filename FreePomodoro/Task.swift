//
//  Task.swift
//  FreePomodoro
//
//  Created by Edgar Muniz Berlinck on 2023-10-19.
//

import Foundation

struct Task: Codable {
    let id: Int
    let title: String
    let description: String
    let status: String
    let pomodoros: Int
}
