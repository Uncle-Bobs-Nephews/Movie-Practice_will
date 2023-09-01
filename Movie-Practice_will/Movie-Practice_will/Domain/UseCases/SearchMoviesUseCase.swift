//
//  SearchMoviesUseCase.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import RxSwift

protocol SearchMoviesUseCase {
    func execute(requestValue: SearchMoviesUseCaseRequestValue) -> Observable<MoviesPage>
}

final class DefaultSearchMoviesUseCase: SearchMoviesUseCase {
    
    private let moviesRepository: MoviesRepository
    private let posterImagesRepository: PosterImagesRepository
    
    init(moviesRepository: MoviesRepository,
         posterImagesRepository: PosterImagesRepository) {
        self.moviesRepository = moviesRepository
        self.posterImagesRepository = posterImagesRepository
    }
    
    func execute(requestValue: SearchMoviesUseCaseRequestValue) -> Observable<MoviesPage> {
        return moviesRepository.fetchMoviesList(query: requestValue.query,
                                                page: requestValue.page)
    }
}

struct SearchMoviesUseCaseRequestValue {
    let query: MovieQuery
    let page: Int
}
