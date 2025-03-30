//
//  Networks.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import Foundation

enum Link {
    case user
    case plants
    case soils

    var url: URL {
        switch self {
        case .user:
            return URL(string: "http://0.0.0.0:8080/api/v1/plant/get_all")!
        case .plants:
            return URL(string: "http://0.0.0.0:8080/api/v1/plant/get_all")!
        case .soils:
            return URL(string: "http://0.0.0.0:8080/api/v1/soil/get_all")!
            
        }
    }
}

