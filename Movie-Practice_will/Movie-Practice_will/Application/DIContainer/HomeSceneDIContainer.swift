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
        let baseNetwork: MovieNetwork
        let imageNetwork: ImageNetwork
    }
    
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    func makeSearchMoviesUseCase() -> SearchMoviesUseCase {
        DefaultSearchMoviesUseCase(
            moviesRepository: makeMoviesRepository(),
            posterImagesRepository: makePosterImagesRepository()
        )
    }
    
    // MARK: - Repositories
    func makeMoviesRepository() -> MoviesRepository {
        DefaultMoviesRepository(
            network: self.dependencies.baseNetwork)
    }
    
    func makePosterImagesRepository() -> PosterImagesRepository {
        DefaultPosterImagesRepository(
            network: self.dependencies.imageNetwork)
    }
    
    // MARK: - Movies List
    func makeHomeViewController()
    -> UIViewController {
        return HomeViewController.instance(viewModel: makeHomeViewModel(),
                                    posterImagesRepository: makePosterImagesRepository())
    }
    
    func makeHomeViewModel()
    -> HomeViewModel {
        return HomeViewModel(useCase: makeSearchMoviesUseCase())
    }
}
