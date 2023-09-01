//
//  Networkable.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import Moya

protocol Networkable {
    associatedtype Target: TargetType
    static func makeProvider() -> MoyaProvider<Target>
}

extension Networkable {
    
    static func makeProvider() -> MoyaProvider<Target> {
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
