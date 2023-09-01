//
//  HomeTableView.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/30.
//

import UIKit

protocol HomeViewable: BaseViewable {
    
}

final class HomeView: UIView, HomeViewable {
    
    let searchBarContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let searchController: UISearchController = {
        let sc = UISearchController()
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.barStyle = .black
        sc.hidesNavigationBarDuringPresentation = false
//        sc.searchBar.searchTextField.accessibilityIdentifier = AccessibilityIdentifier.searchField
        return sc
    }()
    
    let homeTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tv.register(HomeTableViewCell.self,
                    forCellReuseIdentifier: HomeTableViewCell.identifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(searchBarContainer)
        addSubview(homeTableView)
        searchBarContainer.addSubview(searchController.searchBar)
    }
    
    func makeConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBarContainer.topAnchor.constraint(equalTo: topAnchor),
            searchBarContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBarContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBarContainer.heightAnchor.constraint(equalToConstant: 56),
            
            homeTableView.topAnchor.constraint(equalTo: searchBarContainer.bottomAnchor),
            homeTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
