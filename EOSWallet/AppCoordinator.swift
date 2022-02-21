//
//  AppCoordinator.swift
//  EOSWallet
//
//  Created by Jonathan Go on 21.02.22.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
         let viewController = ViewController()
         let navController = UINavigationController(rootViewController: viewController)
         window.rootViewController = navController
         window.makeKeyAndVisible()
        
    }
}
