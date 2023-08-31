//
//  HomeTableViewCell.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/30.
//

import UIKit

protocol HomeTableViewCellable: BaseViewable {
    func bind(viewModel: HomeTableViewItemViewModel)
}

final class HomeTableViewCell: UITableViewCell, HomeTableViewCellable {
    
    static let identifier = "HomeTableViewCell"
    static let height = CGFloat(130)
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let releaseDateLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let overviewLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let posterImageView: UIImageView = {
        let lv = UIImageView()
        lv.translatesAutoresizingMaskIntoConstraints = false
        return lv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(posterImageView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            posterImageView.widthAnchor.constraint(equalToConstant: 80),
            posterImageView.heightAnchor.constraint(equalToConstant: 10),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: -16),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: -16),
            
            overviewLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 6),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: -16),
        ])
    }
    
    func bind(viewModel: HomeTableViewItemViewModel) {
        titleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        overviewLabel.text = viewModel.overview
        if let posterPath = viewModel.posterPath {
            do {
                posterImageView.image = UIImage(data: try Data(contentsOf: URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")!))
            } catch {
                print("없어?")
            }
        }
    }
}
