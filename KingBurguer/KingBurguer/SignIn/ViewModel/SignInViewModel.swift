//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 23/01/24.
//

import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInState)
}

class SignInViewModel {
    
    var delegate: SignInViewModelDelegate?
    var coordinator: SignInCoordinator?
    
    var state: SignInState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .goToHome
        }
    }
    
    func goToSignUp() {
        coordinator?.signUp()
    }
    
    func goToHome() {
        coordinator?.home()
    }
    
}

