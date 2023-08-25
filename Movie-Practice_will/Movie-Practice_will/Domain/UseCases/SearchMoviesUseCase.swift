//
//  SearchMoviesUseCase.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import Foundation

protocol SearchMoviesUseCase {
    func execute(
        requestValue: SearchMoviesUseCaseRequestValue,
        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable?
}

final class DefaultSearchMoviesUseCase: SearchMoviesUseCase {

    private let moviesRepository: MoviesRepository

    init(
        moviesRepository: MoviesRepository
    ) {

        self.moviesRepository = moviesRepository
    }

    func execute(
        requestValue: SearchMoviesUseCaseRequestValue,
        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable? {

        return moviesRepository.fetchMoviesList(
            query: requestValue.query,
            page: requestValue.page,
            completion: { result in
            completion(result)
        })
    }
}

struct SearchMoviesUseCaseRequestValue {
    let query: MovieQuery
    let page: Int
}
