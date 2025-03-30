//
//  ApiClientNote.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation

@MainActor
final class ApiClientNote: ObservableObject {
    static let shared = ApiClientNote()
    @Published var notes: [Note] = []

    
    func fetchNotes(data: NoteDTO, completion: @escaping (Result<(), NetworkError>) -> Void) {
        var fetchRequest = URLRequest(url: Link.note(str: "get_all").url)
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
                let decodedData = try JSONDecoder().decode([Note].self, from: data)
                DispatchQueue.main.async {
                    self?.notes = decodedData
                }
                completion(.success(()))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
        }
    
    func create(data: NewNote, completion: @escaping (Result<(), NetworkError>) -> Void) {
        var fetchRequest = URLRequest(url: Link.garden_bed(str: "save").url)
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
