//
//  User.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let email: String
    let name: String
    let password: String
}
