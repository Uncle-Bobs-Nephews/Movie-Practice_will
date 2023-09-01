//
//  HomeViewController.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import UIKit
import RxSwift

protocol HomeViewControllable: BaseViewControllable {
    func setupHomeTableViewDelegate()
}

final class HomeViewController: UIViewController, HomeViewControllable {
    
    private let homeView = HomeView()
    private var viewModel: HomeViewModel!
    private var posterImagesRepository: PosterImagesRepository?
    var disposeBag = DisposeBag()
    
    static func instance(viewModel: HomeViewModel,
                         posterImagesRepository: PosterImagesRepository) -> UIViewController {
        let vc = HomeViewController(nibName: nil,
                                    bundle: nil)
        vc.viewModel = viewModel
        vc.posterImagesRepository = posterImagesRepository
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        makeConstraints()
        setupHomeTableViewDelegate()
        bindViewModel()
    }
    
    func addSubviews() {
        view.addSubview(homeView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func bindViewModel() {
        let searchButtonClickedTrigger = homeView.searchController.searchBar
            .rx.searchButtonClicked.asDriver()
        let searchText = homeView.searchController.searchBar.rx.text.asDriver()
        
        let input = HomeViewModel.Input(searchButtonClickedTrigger: searchButtonClickedTrigger,
                                        searchText: searchText)
        
        let output = viewModel.transform(input: input)
        output.moveList
            .drive(homeView.homeTableView.rx.items(cellIdentifier: HomeTableViewCell.identifier, cellType: HomeTableViewCell.self)) { index, item, cell in
                cell.bind(viewModel: HomeTableViewItemViewModel(movie: item),
                          posterImagesRepository: self.posterImagesRepository)
            }.disposed(by: disposeBag)
    }
}

extension HomeViewController {
    
    func setupHomeTableViewDelegate() {
        homeView.homeTableView.delegate = self
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
