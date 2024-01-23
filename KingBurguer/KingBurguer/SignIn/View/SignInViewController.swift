//
//  SignInViewController.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 12/01/24.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    lazy var email: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .gray
        ed.placeholder = "Entre com seu email"
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    lazy var password: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .gray
        ed.placeholder = "Entre com sua senha"
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    lazy var send: UIButton = {
        let btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return btn
    }()
    
    lazy var register: UIButton = {
        let btn = UIButton()
        btn.setTitle("Criar Conta", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(registerDidTap), for: .touchUpInside)
        return btn
    }()
    
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Login"
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(send)
        view.addSubview(register)

        let emailConstraints = [
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0),
            email.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let passwordConstraints = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let sendConstraints = [
            send.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            send.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            send.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            send.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let registerConstraints = [
            register.topAnchor.constraint(equalTo: send.bottomAnchor, constant: 20),
            register.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            register.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            register.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(sendConstraints)
        NSLayoutConstraint.activate(registerConstraints)
        
    }
    
    @objc func sendDidTap(_ sender: UIButton) {
        viewModel?.send()
    }
    
    @objc func registerDidTap(_ sender: UIButton) {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}

extension SignInViewController: SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInState) {
        switch(state) {
            case .none:
                break
            case .loading:
                break
            case .goToHome:
                break
            case .error(let msg):
                let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                
                self.present(alert, animated: true)
                break
        }
    }
}
