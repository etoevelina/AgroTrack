//
//  NetworkError.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation

enum NetworkError: Error {
    case noData
    case notFound
    case decodingError
    case encodingError
    case networkError(Error)
    case serverError
    case cannotParseNumber
    case noToken
}
