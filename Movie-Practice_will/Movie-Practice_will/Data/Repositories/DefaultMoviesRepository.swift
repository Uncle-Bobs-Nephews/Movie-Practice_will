//
//  DefaultMoviesRepository.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/29.
//

import RxSwift

final class DefaultMoviesRepository {
    
    private let network: MovieNetwork
    
    init(network: MovieNetwork) {
        self.network = network
    }
}

extension DefaultMoviesRepository: MoviesRepository {
    
    func fetchMoviesList(query: MovieQuery,
                         page: Int) -> Observable<MoviesPage> {
        network.fetchMoviesList(query: query, page: page)
    }
}
