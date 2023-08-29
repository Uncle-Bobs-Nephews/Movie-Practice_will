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
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
//        let moveList: Driver<[Movie]>
    }
    
    private let useCase: SearchMoviesUseCase
    
    init(useCase: SearchMoviesUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
//        let movieList = input.trigger.flatMapLatest {
//            return self.useCase
//                .asDriver(onErrorJustReturn: [])
//        }
        return Output()
//        return Output(moveList: movieList)
//        return Output(moveList: Driver<[Movie]>([]))
    }
}
