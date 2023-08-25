//
//  PosterImagesRepository.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import Foundation

protocol PosterImagesRepository {
    func fetchImage(
        with imagePath: String,
        width: Int,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> Cancellable?
}
