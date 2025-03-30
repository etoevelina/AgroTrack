//
//  ApiClientPlants.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Combine
import Foundation
import SwiftUI

@MainActor
final class ApiClientPlants: ObservableObject {
    static let shared = ApiClientPlants()
    @Published var plants: [Plants]?
    func fetchPlantes() async throws {
        let fetchRequest = URLRequest(url: Link.plants.url)
        
        let (data, response) = try await URLSession.shared.data(for: fetchRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }
        
        print("Status code: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode == 404 {
            throw NetworkError.notFound
        }
        
        do {
            let decodedPlants = try JSONDecoder().decode([Plants].self, from: data)
            withAnimation {
                self.plants = decodedPlants
            }
        } catch {
            throw NetworkError.decodingError
        }
    }
}
