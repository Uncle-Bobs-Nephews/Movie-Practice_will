//
//  ImageTarget.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/09/01.
//

import Moya

enum ImageTarget {
    case fetchImage(path: String, width: Int)
}

extension ImageTarget: ImageTargetType {
    
    var path: String {
        switch self {
        case .fetchImage(let path, let width):
            return "/t/p/w\(width)\(path)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchImage:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchImage:
            return .requestPlain
        }
    }
}
