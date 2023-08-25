//
//  Movie.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import Foundation

public struct Movie: Equatable, Identifiable {
    public typealias Identifier = String
    enum Genre {
        case adventure
        case scienceFiction
    }
    public let id: Identifier
    public let title: String?
    public let originalTitle: String?
    public let overview: String?
    public let posterPath: String?
    public let releaseDate: Date?
}

struct MoviesPage: Equatable {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
}
