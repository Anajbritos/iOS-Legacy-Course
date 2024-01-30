//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 26/01/24.
//

import Foundation
import UIKit

class HomeCoordinator {
    
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
          
        let homeVC = HomeViewController()
        window?.rootViewController = homeVC
    }
}


