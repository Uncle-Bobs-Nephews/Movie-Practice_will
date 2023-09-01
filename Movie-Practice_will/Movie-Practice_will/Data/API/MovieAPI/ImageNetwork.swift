//
//  ImageNetwork.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/09/01.
//

import Foundation
import RxSwift
import RxMoya

protocol ImageNetworkable: Networkable {
    func fetchImage(path: String, width: Int) -> Observable<Data?>
}

final class ImageNetwork: ImageNetworkable {
    
    private let provider = makeProvider()
    typealias Target = ImageTarget
    
    func fetchImage(path: String, width: Int) -> Observable<Data?> {
        return provider.rx.request(.fetchImage(path: path, width: width))
            .map { $0.data }
            .asObservable()
    }
}
