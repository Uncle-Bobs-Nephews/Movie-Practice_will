//
//  BaseViewControllable.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/27.
//

import RxSwift

protocol BaseViewControllable {
    
    /// Dispose disposables
    var disposeBag: DisposeBag { get set }
    
    /// Adding subviews
    func addSubviews()
    
    /// Set Constraints of subviews
    func makeConstraints()
    
    /// Data Binding
    func bindViewModel()
}
