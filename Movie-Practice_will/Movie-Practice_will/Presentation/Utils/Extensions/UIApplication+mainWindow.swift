//
//  UIApplication+mainWindow.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import UIKit

extension UIApplication {
    
    static var mainWindow: UIWindow? {
        return self
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .last { $0.isKeyWindow }
    }
}
