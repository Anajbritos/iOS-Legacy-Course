//
//  HomeViewController.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 26/01/24.
//

import Foundation
import UIKit

class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        let coupomVC = UINavigationController(rootViewController: CoupomViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        feedVC.title = "Inicio"
        coupomVC.title = "Cupons"
        profileVC.title = "Perfil"
        
        tabBar.tintColor = .red
        
        feedVC.tabBarItem.image = UIImage(systemName: "house")
        coupomVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle")
        
        setViewControllers([feedVC, coupomVC, profileVC], animated: true)
    }
    
    var viewModel: HomeViewModel?
}
