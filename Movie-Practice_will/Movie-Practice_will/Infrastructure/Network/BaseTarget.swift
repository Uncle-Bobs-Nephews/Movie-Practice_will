//
//  BaseTarget.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org")!
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(Storage.apiKey)"
        ]
    }
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return dict ?? [:]
        } catch {
            return [:]
        }
    }
}
