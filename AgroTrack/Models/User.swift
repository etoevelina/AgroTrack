//
//  User.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let email: String
    let name: String
    let password: String
}

struct NewUser: Codable {
    let email: String
    let password: String
}
