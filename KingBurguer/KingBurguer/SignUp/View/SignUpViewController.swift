//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 23/01/24.
//

import Foundation
import UIKit

enum SignUpForm: Int {
    case name = 0x1
    case email = 0x2
    case password = 0x4
    case document = 0x8
    case birthday = 0x10
}

class SignUpViewController: UIViewController {
    
    let scroll: UIScrollView = {
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var name: TextField = {
        let ed = TextField()
        ed.placeholder = "Entre com seu nome"
        ed.error = "Nome deve ter no minimo 3 caracteres"
        ed.delegate = self
        ed.returnKeyType = .next
        ed.failure = {
            ed.text.count <= 8
        }
        ed.tag = 1
        ed.bitmask = SignUpForm.name.rawValue
        return ed
    }()
    
    lazy var email: TextField = {
        let ed = TextField()
        ed.placeholder = "Entre com seu e-mail"
        ed.error = "Email válido"
        ed.delegate = self
        ed.returnKeyType = .next
        ed.keyboardType = .emailAddress
        ed.failure = {
            !ed.text.isEmail()
        }
        ed.tag = 2
        ed.bitmask = SignUpForm.email.rawValue
        return ed
    }()
    
    lazy var password: TextField = {
        let ed = TextField()
        ed.placeholder = "Entre com sua senha"
        ed.error = "Digite uma senha válida"
        ed.delegate = self
        ed.returnKeyType = .next
        ed.secureTextEntry = true
        ed.failure = {
            ed.text.count <= 8
        }
        ed.tag = 3
        ed.bitmask = SignUpForm.password.rawValue
        return ed
    }()
    
    lazy var document: TextField = {
        let ed = TextField()
        ed.placeholder = "Entre com seu cpf"
        ed.error = "Digite um documento válido"
        ed.delegate = self
        ed.returnKeyType = .next
        ed.failure = {
            ed.text.count != 14
        }
        ed.tag = 4
        ed.maskField = Mask(mask: "###.###.###-##")
        ed.bitmask = SignUpForm.document.rawValue
        ed.keyboardType = .numberPad
        return ed
    }()
    
    lazy var birthday: TextField = {
        let ed = TextField()
        ed.placeholder = "Entre com sua data de nascimento"
        ed.error = "Digite uma data de nascimento válida"
        ed.delegate = self
        ed.returnKeyType = .done
        ed.failure = {
            let invalidCount = ed.text.count != 10
            let dt = DateFormatter()
            dt.locale = Locale(identifier: "en_US_POSIX")
            dt.dateFormat = "dd/MM/yyyy"
            let date = dt.date(from: ed.text)
            let invalidDate = date == nil
            
            return invalidDate || invalidCount
        }
        ed.tag = 5
        ed.maskField = Mask(mask: "##/##/####")
        ed.bitmask = SignUpForm.birthday.rawValue
        ed.keyboardType = .numberPad
        return ed
    }()
    
    lazy var send: LoadingButton = {
        let btn = LoadingButton()
        btn.title = "Entrar"
        btn.titleColor = .white
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(sendDidTap))
        btn.enable(false)
        return btn
    }()
    
    var viewModel: SignUpViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    var bitmaskResult = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        container.addSubview(name)
        container.addSubview(email)
        container.addSubview(password)
        container.addSubview(document)
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
        ]
        
        let emailConstraints = [
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ]
        
        let passwordConstraints = [
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            password.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ]
        
        let documentConstraints = [
            document.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            document.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            document.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ]
        
        let birthdayConstraints = [
            birthday.topAnchor.constraint(equalTo: document.bottomAnchor, constant: 10),
            birthday.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            birthday.trailingAnchor.constraint(equalTo: name.trailingAnchor),
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
        NSLayoutConstraint.activate(documentConstraints)
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

extension SignUpViewController: TextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.returnKeyType == .done) {
            view.endEditing(true)
            return false
        }
        let nextTag = textField.tag + 1
        let component = container.findViewByTag(tag: nextTag) as? TextField
        if (component != nil) {
            component?.gainFocus()
        } else {
            view.endEditing(true)
        }
        return false
    }
    
    func textFieldDidChanged(isValid: Bool, bitmask: Int) {
        if isValid {
            self.bitmaskResult = self.bitmaskResult | bitmask }
        else {
            self.bitmaskResult = self.bitmaskResult & ~bitmask }
        
        self.send.enable(
            (SignUpForm.name.rawValue & self.bitmaskResult != 0) &&
            (SignUpForm.email.rawValue & self.bitmaskResult != 0 ) &&
            (SignUpForm.password.rawValue & self.bitmaskResult != 0 ) &&
            (SignUpForm.document.rawValue & self.bitmaskResult != 0 ) &&
            (SignUpForm.password.rawValue & self.bitmaskResult != 0 )
        )
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
