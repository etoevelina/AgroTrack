//
//  Report.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation
struct Note: Identifiable, Codable {
    let id: Int?
    let garden_bed_id: Int
    let image: [UInt8]
    let plant_changes: String
    let plant_height: Int
    let text: String
}

struct NewNote: Codable {
    let garden_bed_id: Int
    let image: [UInt8]
    let plant_changes: String
    let plant_height: Int
    let text: String
}

struct NoteDTO: Codable {
    let garden_bed_id: Int
}
