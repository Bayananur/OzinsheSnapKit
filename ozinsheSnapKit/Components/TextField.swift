//
//  TextField.swift
//  ozinsheSnapKit
//
//  Created by Bauyrzhan Seidazymov on 13.02.2024.
//

import UIKit

class TextField: UITextField {
    private var isPassword: Bool = false
    private var leftImageIcon: String = "email"
    
    private let leftImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Eye"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customize()
    }
    
    var padding = UIEdgeInsets(top: 0, left: 44, bottom: 0, right: 56);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension TextField: UITextFieldDelegate {
    private func customize() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        
        font = UIFont(name: "SFProDisplay-SemiBold", size: 16)
        textColor = UIColor(named: "black") ?? .black
        
        setBorderColor()
        
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEndOnExit)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        
        addSubview(leftImageView)
        leftImageView.image = UIImage(named: leftImageIcon)
        leftImageView.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.left.equalTo(16)
            make.verticalEdges.equalToSuperview()
        }
        
        if isPassword {
            textContentType = .password
            isSecureTextEntry = true
            isUserInteractionEnabled = true
            addSubview(showPasswordButton)
            
            showPasswordButton.addTarget(
                self,
                action: #selector(showPasswordButtonTapped),
                for: .touchUpInside
            )
            
            showPasswordButton.snp.makeConstraints { make in
                make.height.width.equalTo(54)
                make.right.equalTo(0)
                make.verticalEdges.equalToSuperview()
            }
        }
    }
    
    @objc private func showPasswordButtonTapped () {
        isSecureTextEntry.toggle()
    }
    
    private func setBorderColor(_ active: Bool = false) {
        layer.borderColor = active ? UIColor(named: "ActiveBorder")?.cgColor : UIColor(named: "Border")?.cgColor
    }
    
    @objc private func editingDidBegin() {
        setBorderColor(true)
    }
    
    @objc private func editingDidEnd() {
        setBorderColor(false)
    }
}

extension TextField {
    func setLeftImage(imageName: String) {
        self.leftImageIcon = imageName
        customize()
    }
    
    func setPasswordTextField(isPassword: Bool) {
        self.isPassword = isPassword
        customize()
    }
}
