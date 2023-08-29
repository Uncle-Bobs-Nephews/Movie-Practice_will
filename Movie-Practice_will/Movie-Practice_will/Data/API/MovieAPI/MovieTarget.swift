//
//  MovieTarget.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import Moya

enum MovieTarget {
    case search(request: MoviesRequest)
}

extension MovieTarget: BaseTargetType {
    
    var path: String {
        switch self {
        case .search:
            return "/3/search/movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .search(let request):
            return .requestParameters(parameters: request.toDictionary(), encoding: JSONEncoding.default)
        }
    }
}
