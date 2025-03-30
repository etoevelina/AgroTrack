//
//  SensorData.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation
struct SensorData: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
    let humidity: Double
    let light: Double
}
