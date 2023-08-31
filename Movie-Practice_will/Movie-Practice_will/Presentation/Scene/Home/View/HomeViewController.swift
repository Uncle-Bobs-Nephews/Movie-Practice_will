//
//  HomeViewController.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import UIKit
import RxSwift

protocol HomeViewControllable: BaseViewControllable {

}

final class HomeViewController: UIViewController, HomeViewControllable {
    
    private let viewModel: HomeViewModel
    private let homeView = HomeView()
    var disposeBag = DisposeBag()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        makeConstraints()
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
                
                print("item - \(item)")
                cell.bind(viewModel: HomeTableViewItemViewModel(movie: item))
            }.disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
