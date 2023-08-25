//
//  MoviesRequest.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

public struct MoviesRequest: Encodable {
    public let query: String
    public let page: Int
}
