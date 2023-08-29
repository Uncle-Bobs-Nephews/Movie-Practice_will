//
//  ViewModelType.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/27.
//

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
