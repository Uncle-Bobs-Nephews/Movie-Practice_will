//
//  MovieAPI.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import RxSwift
import RxMoya

public final class MovieAPI: Networkable {
    
    private let provider = makeProvider()
    typealias Target = MovieTarget
    
    public func fetchMovies(request: MoviesRequest) -> Single<MoviesResponse> {
        return provider.rx.request(.search(request: request)).map(MoviesResponse.self)
    }
}
