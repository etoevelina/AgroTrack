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
    case garden_bed(str: String)
    case note(str: String)

    var url: URL {
        switch self {
        case .user:
            return URL(string: "http://137.184.28.210:8080/api/v1/user/auth")!
        case .plants:
            return URL(string: "http://137.184.28.210:8080/api/v1/plant/get_all")!
        case .soils:
            return URL(string: "http://137.184.28.210:8080/api/v1/soil/get_all")!
            
        case .garden_bed(let str):
            return URL(string: "http://137.184.28.210:8080/api/v1/garden_bed/\(str)")!
        case .note(let str):
            return URL(string: "http://137.184.28.210:8080/api/v1/note/\(str)")!
        }
        
    
    }
}

