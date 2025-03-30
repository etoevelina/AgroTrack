//
//  AgroTrackApp.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

@main
struct AgroTrackApp: App {
    let defaults = UserDefaults.standard.bool(forKey: "login")

    var body: some Scene {
        WindowGroup {
            if defaults {
                ContentView()
            } else {
                AuthorizationView()
            }
        }
    }
}
