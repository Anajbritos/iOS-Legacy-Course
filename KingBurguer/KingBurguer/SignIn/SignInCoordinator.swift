//
//  SignInCoordinator.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 23/01/24.
//

import Foundation
import UIKit

class SignInCoordinator {
    
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let viewModel = SignInViewModel()
        let signInVC = SignInViewController()
        signInVC.viewModel = viewModel
        
        navigationController.pushViewController(signInVC, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}
