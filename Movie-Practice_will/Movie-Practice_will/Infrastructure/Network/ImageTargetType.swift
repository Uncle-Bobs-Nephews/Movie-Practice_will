//
//  ImageTargetType.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/09/01.
//

import Foundation
import Moya

protocol ImageTargetType: TargetType { }

extension ImageTargetType {
    
    var baseURL: URL {
        return URL(string: "https://image.tmdb.org")!
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(Storage.apiKey)"
        ]
    }
}

