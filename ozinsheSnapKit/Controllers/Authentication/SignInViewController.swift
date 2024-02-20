//
//  LogInViewController.swift
//  ozinsheSnapKit
//
//  Created by Bauyrzhan Seidazymov on 13.02.2024.
//
import SnapKit
import UIKit


class SignInViewController: UIViewController {
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.text = "Сәлем"
       // label.textAlignment = .left
        
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(named: "greyScale")
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.text = "Аккаунтқа кіріңіз"
        //label.textAlignment = .left
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    private let emailTextfield: UITextField! = {
        let textfield = UITextField()
        textfield.backgroundColor = UIColor(named: "backgroundColor")//?
        textfield.font = UIFont(name: "SFProDisplay-Semibold", size: 12)//?
        textfield.text = ""
        textfield.textAlignment = .left
        textfield.layer.cornerRadius = 8
       return textfield
    }()
    
    private let passwordLabel = UILabel()
    private let passwordTextfield = UITextField()
    let passwordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Құпия сөзді ұмыттыңыз ба?", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        button.setTitleColor(UIColor(named: "pagerSelected"), for: .normal)
        return button
    }()
    
    
    let enterButton: UIButton = {
        let button = Button()
        button.setTitle("Кіру", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
       configureUI()
        
    }
}

extension SignInViewController {
    func configureUI() {
        setFirstLabel()
        setSecondLabel()
        setEmailLabel()
        setEmailTextfield()
        setPasswordLabel()
        
    }
    func setFirstLabel() {
        
    }
    func setSecondLabel() {
        
    }
    func setEmailLabel() {
        
    }
    func setEmailTextfield() {
        
    }
    func setPasswordLabel() {
        
    }
    func setPasswordTextfield() {
        
    }
    func setPasswordButton() {
        
    }
    func setEnterButton() {
        
    }
}
