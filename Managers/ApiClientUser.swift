//
//  ApiClient.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Combine
import Foundation
import SwiftUI

@MainActor
final class ApiClientUser: ObservableObject {
    static let shared = ApiClientUser()
    
    func auth(data: NewUser, completion: @escaping (Result<(), NetworkError>) -> Void) {
        var fetchRequest = URLRequest(url: Link.user.url)
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
}
