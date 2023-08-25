//
//  MoviesResponse.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

public struct MoviesResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case movies = "results"
    }
    public let page: Int
    public let totalPages: Int
    public let movies: [MovieDTO]
}

extension MoviesResponse {
    public struct MovieDTO: Decodable {
        private enum CodingKeys: String, CodingKey {
            case id
            case title
            case genre
            case posterPath = "poster_path"
            case overview
            case releaseDate = "release_date"
        }
        public enum GenreDTO: String, Decodable {
            case adventure
            case scienceFiction = "science_fiction"
        }
        public let id: Int
        public let title: String?
        public let genre: GenreDTO?
        public let posterPath: String?
        public let overview: String?
        public let releaseDate: String?
    }
}
