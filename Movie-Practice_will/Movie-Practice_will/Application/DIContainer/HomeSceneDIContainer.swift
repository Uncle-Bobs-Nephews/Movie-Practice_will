//
//  HomeSceneDIContainer.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/28.
//

import UIKit
import SwiftUI

final class HomeSceneDIContainer {
    
    struct Dependencies {
        let network: MovieNetwork
    }
    
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    func makeSearchMoviesUseCase() -> SearchMoviesUseCase {
        DefaultSearchMoviesUseCase(
            moviesRepository: makeMoviesRepository()
        )
    }
    
    // MARK: - Repositories
    func makeMoviesRepository() -> MoviesRepository {
        DefaultMoviesRepository(
            network: self.dependencies.network)
    }
    
    // MARK: - Movies List
    func makeHomeViewController()
    -> HomeViewController {
        HomeViewController(viewModel: makeHomeViewModel())
    }
    
    func makeHomeViewModel()
    -> HomeViewModel {
        return HomeViewModel(useCase: makeSearchMoviesUseCase())
    }
}
