//
//  MoviesRepository.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import Foundation

protocol MoviesRepository {
    @discardableResult
    func fetchMoviesList(
        query: MovieQuery,
        page: Int,
        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable?
}
