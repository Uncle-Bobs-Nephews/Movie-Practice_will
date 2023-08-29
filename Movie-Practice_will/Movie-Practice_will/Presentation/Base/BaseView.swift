//
//  BaseView.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/28.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Adding subviews
    func addSubviews() { }
    
    // Set Constraints of subviews
    func makeConstraints() { }
}
