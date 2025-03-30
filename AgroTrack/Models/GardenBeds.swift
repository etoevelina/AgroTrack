//
//  GardenBeds.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation
struct GardenBeds: Identifiable {
    let id = UUID()
    let name: String
    let user_id: Int
    let plant_id: Int
    let soil_id: Int
    let sowing_date: Int
    let collectiond_date: Int
    let specific_condition: String
}
