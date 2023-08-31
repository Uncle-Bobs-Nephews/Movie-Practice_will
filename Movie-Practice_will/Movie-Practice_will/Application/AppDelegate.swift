//
//  AppDelegate.swift
//  Movie-Practice_will
//
//  Created by SeungMin on 2023/08/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let appDIContainer = AppDIContainer()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        AppAppearance.setupAppearance()
        
        let homeSceneDIContainer = appDIContainer.makeHomeSceneDIContainer()
        let nav = UINavigationController(rootViewController: homeSceneDIContainer.makeHomeViewController())
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}

