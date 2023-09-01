//
//  DefaultPosterImagesRepository.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/09/01.
//

import RxSwift
import Foundation

final class DefaultPosterImagesRepository {
    
    private let network: ImageNetwork
    
    init(network: ImageNetwork) {
        self.network = network
    }
}

extension DefaultPosterImagesRepository: PosterImagesRepository {
    
    func fetchImage(with imagePath: String,
                    width: Int) -> Observable<Data?> {
        network.fetchImage(path: imagePath, width: width)
    }
}
