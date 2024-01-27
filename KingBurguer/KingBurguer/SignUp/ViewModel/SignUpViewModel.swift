//
//  SignUpViewModel.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 23/01/24.
//

import Foundation
import UIKit

protocol SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState)
}

class SignUpViewModel {
    
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.state = .goToHome
        }
    }
    
    func goToHome() {
        coordinator?.home()
    }
}
