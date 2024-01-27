//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 23/01/24.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    lazy var name: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .gray
        ed.placeholder = "Entre com seu nome"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        return ed
    }()
    
    lazy var email: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .gray
        ed.placeholder = "Entre com seu e-mail"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        return ed
    }()
    
    lazy var password: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .gray
        ed.placeholder = "Entre com sua senha"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        return ed
    }()
    
    lazy var document: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .gray
        ed.placeholder = "Entre com seu cpf"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        return ed
    }()
    
    lazy var birthday: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .gray
        ed.placeholder = "Entre com sua data de nascimento"
        ed.translatesAutoresizingMaskIntoConstraints =  false
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
    
    var viewModel: SignUpViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(name)
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(birthday)
        view.addSubview(send)
        
        let nameConstraints = [
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            name.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let emailConstraints = [
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            email.heightAnchor.constraint(equalToConstant: 50.0),
        ] 
        
        let passwordConstraints = [
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            password.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            password.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let birthdayConstraints = [
            birthday.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            birthday.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            birthday.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            birthday.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let sendConstraints = [
            send.topAnchor.constraint(equalTo: birthday.bottomAnchor, constant: 10),
            send.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            send.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(birthdayConstraints)
        NSLayoutConstraint.activate(sendConstraints)
    }
    
    @objc func sendDidTap(_ sender: UIButton) {
        viewModel?.send()
    }
}

extension SignUpViewController: SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState) {
        switch(state) {
            case .none:
                break
            case .loading:
                break
            case .goToHome:
            viewModel?.goToHome()
                break
            case .error(let msg):
            send.backgroundColor = .black
                let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
                break
        }
    }
    
    
}
