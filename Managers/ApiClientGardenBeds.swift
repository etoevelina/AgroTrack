//
//  ApiClientGardenBeds.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Combine
import Foundation
import SwiftUI

@MainActor
final class ApiClientGardenBeds: ObservableObject {
    static let shared = ApiClientGardenBeds()
    @Published var gardenBeds: [GardenBeds] = []

    
    
    func create(data: NewGardenBeds, completion: @escaping (Result<(), NetworkError>) -> Void) {
        var fetchRequest = URLRequest(url: Link.garden_bed(str: "create").url)
        fetchRequest.httpMethod = "POST"
        fetchRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encodedData = try JSONEncoder().encode(data)
            fetchRequest.httpBody = encodedData
        } catch {
            completion(.failure(.encodingError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: fetchRequest) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.serverError))
                return
            }
            
            completion(.success(()))
        }
        
        task.resume()
    }
    
    func fetchGardenBeds(data: GardenBedsDTO, completion: @escaping (Result<(), NetworkError>) -> Void) {
            var fetchRequest = URLRequest(url: Link.garden_bed(str: "get_all").url)
            fetchRequest.httpMethod = "POST"
            fetchRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                let encodedData = try JSONEncoder().encode(data)
                fetchRequest.httpBody = encodedData
            } catch {
                completion(.failure(.encodingError))
                return
            }
            
            let task = URLSession.shared.dataTask(with: fetchRequest) { [weak self] data, response, error in
                if let error = error {
                    completion(.failure(.networkError(error)))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode),
                      let data = data else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode([GardenBeds].self, from: data)
                    DispatchQueue.main.async {
                        self?.gardenBeds = decodedData
                    }
                    completion(.success(()))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
            task.resume()
        }

}
