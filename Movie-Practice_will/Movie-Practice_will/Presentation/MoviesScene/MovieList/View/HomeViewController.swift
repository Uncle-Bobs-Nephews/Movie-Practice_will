//
//  HomeViewController.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        bindViewModel()
    }
    
    private func bindViewModel() {
//        let input = MovieListViewModel.Input(trigger: <#T##Driver<Void>#>,
//                                             selection: <#T##Driver<IndexPath>#>)
    }
}

