//
//  HomeTableViewCell.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/30.
//

import UIKit
import RxSwift

protocol HomeTableViewCellable: BaseViewable {
    func bind(viewModel: HomeTableViewItemViewModel,
               posterImagesRepository: PosterImagesRepository?)
}

final class HomeTableViewCell: UITableViewCell, HomeTableViewCellable {
    
    static let identifier = "HomeTableViewCell"
    let disposeBag = DisposeBag()
    
    var viewModel: HomeTableViewItemViewModel!
    var posterImagesRepository: PosterImagesRepository?
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .black
        l.numberOfLines = 3
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let releaseDateLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .black
        l.numberOfLines = 2
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let overviewLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.textColor = .black
        l.numberOfLines = 20
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
            posterImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: -20),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            releaseDateLabel.trailingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: -20),
            
            overviewLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 6),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            overviewLabel.trailingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: -20),
        ])
    }
    
    func bind(viewModel: HomeTableViewItemViewModel,
              posterImagesRepository: PosterImagesRepository?) {
        
        self.viewModel = viewModel
        self.posterImagesRepository = posterImagesRepository
        
        titleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        overviewLabel.text = viewModel.overview
        updatePosterImageView(width: 500)
    }
    
    private func updatePosterImageView(width: Int) {
        posterImageView.image = nil
        guard let path = viewModel.posterPath else { return }
        
        posterImagesRepository?.fetchImage(with: path,
                                           width: 500)
        .asDriver(onErrorJustReturn: nil)
        .drive(onNext: { data in
            guard let data else { return }
            self.posterImageView.image = UIImage(data: data)
        }).disposed(by: disposeBag)
    }
}
