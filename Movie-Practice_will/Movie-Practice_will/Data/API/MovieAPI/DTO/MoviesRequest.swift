//
//  MoviesRequest.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

struct MoviesRequest: Encodable {
    let query: String
    let page: Int
}
