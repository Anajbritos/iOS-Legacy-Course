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
    
    var state: SignInState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send() {
        state = .loading
        
        // aqui eu espero 2 segundos (LATENCIA)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .error("Usuario nao existe")
        }
    }
    
    // 1. NADA - preparado para receber o input
    // 2. CARREGANDO
    // 3. SUCESSO - navegar para a tela principal
    // 4. ERRO - mostrar uma mensagem vinda do servidor (usuario nao existe)
    
}

