//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 23/01/24.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    let scroll: UIScrollView = {
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var name: UITextField = {
        let ed = UITextField()
        ed.borderStyle = .roundedRect
        ed.placeholder = "Entre com seu nome"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        ed.delegate = self
        ed.returnKeyType = .next
        ed.tag = 1
        return ed
    }()
    
    lazy var email: UITextField = {
        let ed = UITextField()
        ed.borderStyle = .roundedRect
        ed.placeholder = "Entre com seu e-mail"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        ed.delegate = self
        ed.returnKeyType = .next
        ed.tag = 2
        return ed
    }()
    
    lazy var password: UITextField = {
        let ed = UITextField()
        ed.borderStyle = .roundedRect
        ed.placeholder = "Entre com sua senha"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        ed.delegate = self
        ed.returnKeyType = .next
        ed.tag = 3
        return ed
    }()
    
    lazy var document: UITextField = {
        let ed = UITextField()
        ed.borderStyle = .roundedRect
        ed.placeholder = "Entre com seu cpf"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        ed.delegate = self
        ed.returnKeyType = .next
        ed.tag = 4
        return ed
    }()
    
    lazy var birthday: UITextField = {
        let ed = UITextField()
        ed.borderStyle = .roundedRect
        ed.placeholder = "Entre com sua data de nascimento"
        ed.translatesAutoresizingMaskIntoConstraints =  false
        ed.delegate = self
        ed.returnKeyType = .done
        ed.tag = 5
        return ed
    }()
    
    lazy var send: LoadingButton = {
        let btn = LoadingButton()
        btn.title = "Entrar"
        btn.titleColor = .white
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(sendDidTap))
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
        
        container.addSubview(name)
        container.addSubview(email)
        container.addSubview(password)
        container.addSubview(birthday)
        container.addSubview(send)
        scroll.addSubview(container)
        view.addSubview(scroll)
        
        let scrollContraints = [
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        let heightConstraint = container.heightAnchor.constraint(equalTo: view.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        let containerConstraints = [
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.topAnchor.constraint(equalTo: scroll.topAnchor),
            container.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            container.heightAnchor.constraint(equalToConstant: 470)
        ]
        
        
        let nameConstraints = [
            name.topAnchor.constraint(equalTo: container.topAnchor, constant: 70.0),
            name.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
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
            send.topAnchor.constraint(equalTo: birthday.bottomAnchor, constant: 20),
            send.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            send.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        NSLayoutConstraint.activate(scrollContraints)
        NSLayoutConstraint.activate(containerConstraints)
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(birthdayConstraints)
        NSLayoutConstraint.activate(sendConstraints)
        
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardNotification),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardNotification),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func onKeyboardNotification(_ notification: Notification) {
        let visible = notification.name == UIResponder.keyboardWillShowNotification
        
        let keyboardFrame = visible
        ? UIResponder.keyboardFrameEndUserInfoKey
        : UIResponder.keyboardFrameBeginUserInfoKey
        
        if let keyboardSize = (notification.userInfo?[keyboardFrame] as? NSValue)?.cgRectValue {
            onKeyboardChanged(visible, height: keyboardSize.height)
        }
        
    }
    
    func onKeyboardChanged(_ visible: Bool, height: CGFloat) {
        if (!visible) {
            scroll.contentInset = .zero
            scroll.scrollIndicatorInsets = .zero
        } else {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: height, right: 0.0)
            scroll.contentInset = contentInsets
            scroll.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func dismissKeyboard(_ view: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc func sendDidTap(_ sender: UIButton) {
        viewModel?.send()
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.returnKeyType == .done) {
            view.endEditing(true)
            return false
        }
        let nextTag = textField.tag + 1
        let component = container.findViewByTag(tag: nextTag)
        if (component != nil) {
            component?.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        return false
    }
}

extension UIView {
    func findViewByTag(tag: Int) -> UIView? {
        for subview in subviews {
            if subview.tag == tag {
                return subview
            }
        }
        return nil
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
