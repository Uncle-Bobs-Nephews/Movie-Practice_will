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
//    private let dataTransferService: DataTransferService
//    private let cache: MoviesResponseStorage
//    private let backgroundQueue: DataTransferDispatchQueue

//    init(
//        dataTransferService: DataTransferService,
//        cache: MoviesResponseStorage,
//        backgroundQueue: DataTransferDispatchQueue = DispatchQueue.global(qos: .userInitiated)
//    ) {
//        self.dataTransferService = dataTransferService
//        self.cache = cache
//        self.backgroundQueue = backgroundQueue
//    }
}

extension DefaultMoviesRepository: MoviesRepository {
    func fetchMoviesList(query: MovieQuery,
                         page: Int) -> Observable<MoviesPage> {
        network.fetchMoviesList(query: query, page: page)
    }
    

//    func fetchMoviesList(
//        query: MovieQuery,
//        page: Int,
//        cached: @escaping (MoviesPage) -> Void,
//        completion: @escaping (Result<MoviesPage, Error>) -> Void
//    ) -> Cancellable? {

//        let requestDTO = MoviesRequestDTO(query: query.query, page: page)
//        let task = RepositoryTask()
//
//        cache.getResponse(for: requestDTO) { [weak self, backgroundQueue] result in
//
//            if case let .success(responseDTO?) = result {
//                cached(responseDTO.toDomain())
//            }
//            guard !task.isCancelled else { return }
//
//            let endpoint = APIEndpoints.getMovies(with: requestDTO)
//            task.networkTask = self?.dataTransferService.request(
//                with: endpoint,
//                on: backgroundQueue
//            ) { result in
//                switch result {
//                case .success(let responseDTO):
//                    self?.cache.save(response: responseDTO, for: requestDTO)
//                    completion(.success(responseDTO.toDomain()))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//        }
//        return task
//    }
}
