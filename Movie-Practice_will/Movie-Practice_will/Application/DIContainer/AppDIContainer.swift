//
//  AppDIContainer.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/28.
//

import Foundation

final class AppDIContainer {
    
    // MARK: - DIContainers of scenes
    func makeHomeSceneDIContainer() -> HomeSceneDIContainer {
        let dependencies = HomeSceneDIContainer.Dependencies(
            baseNetwork: MovieNetwork(),
            imageNetwork: ImageNetwork()
        )
        return HomeSceneDIContainer(dependencies: dependencies)
    }
}
