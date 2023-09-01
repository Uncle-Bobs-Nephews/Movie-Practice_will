//
//  Encodable+toDictionary.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/09/01.
//

import Foundation

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
