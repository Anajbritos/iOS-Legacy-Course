//
//  HighlightView.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 30/01/24.
//

import UIKit

class HighlightView: UIView {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "highlight")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let moreButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Resgatar Cupom", for: .normal)
        btn.layer.borderColor = UIColor.systemBackground.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return btn
    }()
    
    private func applyConstraints() {
        
        let moreButtonConstrainst = [
            moreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -8),
            moreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ]
        NSLayoutConstraint.activate(moreButtonConstrainst)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
       
        addGradient()
        
        addSubview(moreButton)
        applyConstraints()
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
