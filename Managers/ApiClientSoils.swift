//
//  ApiClientSoils.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Combine
import Foundation
import SwiftUI

@MainActor
final class ApiClientSoils: ObservableObject {
    static let shared = ApiClientSoils()
    @Published var soils: [Soils]?
    
    func fetchPlants() async throws {
        let fetchRequest = URLRequest(url: Link.soils.url)
        
        let (data, response) = try await URLSession.shared.data(for: fetchRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }
        
        print("Status code: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode == 404 {
            throw NetworkError.notFound
        }
        
        do {
            let decodedSoils = try JSONDecoder().decode([Soils].self, from: data)
            withAnimation {
                self.soils = decodedSoils
            }
        } catch {
            throw NetworkError.decodingError
        }
    }
}

