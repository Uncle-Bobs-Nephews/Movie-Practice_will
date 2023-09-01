//
//  MovieNetwork.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import RxSwift
import RxMoya

protocol MovieNetworkable: Networkable {
    func fetchMoviesList(query: MovieQuery, page: Int) -> Observable<MoviesPage>
}

final class MovieNetwork: MovieNetworkable {
    
    private let provider = makeProvider()
    typealias Target = MovieTarget
    
    func fetchMoviesList(query: MovieQuery, page: Int) -> Observable<MoviesPage> {
        let moviesRequest = MoviesRequest(query: query.query, page: page)
        return provider.rx.request(.fetchMoviesList(request: moviesRequest))
            .map(MoviesResponseDTO.self)
            .compactMap { $0.toDomain() }
            .asObservable()
    }
}
