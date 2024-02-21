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
        return label
    }()
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "greyScale")
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.text = "Аккаунтқа кіріңіз"
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
    let forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Құпия сөзді ұмыттыңыз ба?", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.setTitleColor(UIColor(named: "pagerSelected"), for: .normal)
        button.titleLabel?.textAlignment = .right
        return button
    }()
    let signInButton: Button = {
        let button = Button()
        button.setTitle("Кіру", for: .normal)
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
        label.text = "Аккаунтыныз жоқ па?"
//        label.textAlignment = .center
        return label
    }()
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Тіркелу", for: .normal)
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

extension SignInViewController {
    func configureUI() {
        setFirstLabel()
        setSecondLabel()
        setEmailLabel()
        setEmailTextfield()
        setPasswordLabel()
        setPasswordTextfield()
        setForgetPasswordButton()
        setSignInButton()
        setStackViewSignUp()
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
    func setForgetPasswordButton() {
        view.addSubview(forgetPasswordButton)
        forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(17)
            make.right.equalToSuperview().inset(24)
        }
    }
    func setSignInButton() {
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgetPasswordButton.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
    
    func setStackViewSignUp() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(haveAccountLabel)
        stackView.addArrangedSubview(signUpButton)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(24)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
}

extension SignInViewController {
    @objc
    func signUpButtonTapped() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc
    func signInButtonTapped() {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
    }
}
