//
//  HomeViewModel.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/27.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel: ViewModelType {
    
    struct Input {
        let searchButtonClickedTrigger: Driver<Void>
        let searchText: Driver<String?>
        //        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let moveList: Driver<MoviesPage>
    }
    
    private let useCase: SearchMoviesUseCase
    
    init(useCase: SearchMoviesUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let movieList = input.searchText
            .withLatestFrom(input.searchButtonClickedTrigger) { (query, _) in
                return self.useCase.execute(requestValue: SearchMoviesUseCaseRequestValue(query: MovieQuery(query: query ?? ""), page: 1))
                    .debug()
//                    .map { $0.movies }
            }.flatMapLatest { $0.asDriver(onErrorJustReturn: .init(page: 1, totalPages: 1, movies: [])) }
        return Output(moveList: movieList)
    }
}
