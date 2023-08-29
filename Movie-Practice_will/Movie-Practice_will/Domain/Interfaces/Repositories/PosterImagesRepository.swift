//
//  PosterImagesRepository.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import RxSwift

protocol PosterImagesRepository {
    func fetchImage(with imagePath: String,
                    width: Int) -> Observable<[Movie]>
}
