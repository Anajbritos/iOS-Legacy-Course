//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 26/01/24.
//

import Foundation
import UIKit

class HomeCoordinator {
    
    private let navigationController: UINavigationController
    
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
          
        let homeVC = HomeViewController()
        
        navigationController.pushViewController(homeVC, animated: true)
        window?.rootViewController = navigationController
    }
}


