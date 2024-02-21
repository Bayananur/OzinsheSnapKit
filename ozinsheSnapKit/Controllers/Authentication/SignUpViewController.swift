//
//  SignUpViewController.swift
//  ozinsheSnapKit
//
//  Created by Nazerke Sembay on 21.02.2024.
//
import SnapKit
import UIKit

class SignUpViewController: UIViewController {
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.text = "Тіркелу"
        return label
    }()
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "greyScale")
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.text = "Деректерді толтырыңыз"
        return label
    }()
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.text = "Email"
        return label
    }()
    private let emailTextfield: TextField = {
        let textfield = TextField()
        textfield.placeholder = "Сіздің email"
        textfield.setLeftImage(imageName: "email")
        return textfield
    }()
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.text = "Құпия сөз"
        return label
    }()
    private let passwordTextfield: TextField = {
        let textfield = TextField()
        textfield.setLeftImage(imageName: "password")
        textfield.setPasswordTextField(isPassword: true)
        textfield.placeholder = "Сіздің құпия сөзіңіз"
        return textfield
    }()    
    private let passwordLabel2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.text = "Құпия сөзді қайталаңыз"
        return label
    }()
    private let passwordTextfield2: TextField = {
        let textfield = TextField()
        textfield.setLeftImage(imageName: "password")
        textfield.setPasswordTextField(isPassword: true)
        textfield.placeholder = "Сіздің құпия сөзіңіз"
        return textfield
    }()
    let signUpButton: Button = {
        let button = Button()
        button.setTitle("Тіркелу", for: .normal)
        return button
    }()
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        return stackView
    }()
    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "greyScale")
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        label.text = "Сізде аккаунт бар ма?"
        return label
    }()
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Кіру", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        button.setTitleColor(UIColor(named: "pagerSelected"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        configureUI()
        
    }
}

extension SignUpViewController {
    func configureUI() {
        setFirstLabel()
        setSecondLabel()
        setEmailLabel()
        setEmailTextfield()
        setPasswordLabel()
        setPasswordTextfield()
        setPasswordLabel2()
        setPasswordTextfield2()
        setSignUpButton()
        setStackViewSignIn()
    }
    func setFirstLabel() {
        view.addSubview(firstLabel)
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalTo(view.snp.left).offset(24)
        }
    }
    func setSecondLabel() {
        view.addSubview(secondLabel)
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(0)
            make.left.equalTo(view.snp.left).offset(24)
        }
    }
    func setEmailLabel() {
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(32)
            make.left.equalTo(view.snp.left).offset(24)
        }
    }
    func setEmailTextfield() {
        view.addSubview(emailTextfield)
        emailTextfield.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.height.equalTo(56)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    func setPasswordLabel() {
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextfield.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    func setPasswordTextfield() {
        view.addSubview(passwordTextfield)
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
    func setPasswordLabel2() {
        view.addSubview(passwordLabel2)
        passwordLabel2.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(13)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    func setPasswordTextfield2() {
        view.addSubview(passwordTextfield2)
        passwordTextfield2.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel2.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
    func setSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield2.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
    
    func setStackViewSignIn() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(haveAccountLabel)
        stackView.addArrangedSubview(signInButton)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(24)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
}

extension SignUpViewController {
    @objc
    func signUpButtonTapped() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc
    func signInButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
