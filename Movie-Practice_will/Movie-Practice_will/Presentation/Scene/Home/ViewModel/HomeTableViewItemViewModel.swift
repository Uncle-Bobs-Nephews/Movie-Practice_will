//
//  HomeTableViewItemViewModel.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/31.
//

import Foundation

struct HomeTableViewItemViewModel {
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String?
}

extension HomeTableViewItemViewModel {

    init(movie: Movie) {
        self.title = movie.title ?? ""
        self.posterPath = movie.posterPath
        self.overview = movie.overview ?? ""
        self.releaseDate = dateFormatter.string(from: movie.releaseDate ?? Date())
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
