//
//  ScheduleWater.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation
enum Frequency: String {
    case daily = "daily"
    case weekly = "weekly"
    case monthly = "monthly"
}

enum Status: String {
    case active = "active"
    case inactive = "inactive"
}

struct ScheduleWater: Identifiable {
    let id = UUID()
    let plant_id: Int
    let start_time: Date
    let end_time: Date
    let frequency: Frequency
    let status: Status
    
}
