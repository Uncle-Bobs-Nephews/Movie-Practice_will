//
//  MoviesRepository.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import RxSwift

protocol MoviesRepository {
    @discardableResult
    func fetchMoviesList(query: MovieQuery,
                         page: Int) -> Observable<MoviesPage>
}
