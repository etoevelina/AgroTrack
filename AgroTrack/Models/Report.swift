//
//  Report.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation
struct Report: Identifiable {
    let id = UUID()
    let text: String
    let plantChanges: String
    let plantHeight: Int
    let date: Date
    let hasImage: Bool
}
