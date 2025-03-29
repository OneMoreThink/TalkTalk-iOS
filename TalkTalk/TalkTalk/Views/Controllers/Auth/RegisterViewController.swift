//
//  RegisterViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

protocol RegisterViewControllerProtocol: CoordinatedViewController where CoordinatorType == AuthCoordinator {
    func didTapRegisterCompleteButton()
    func didTapCancelButton()
}

// 임시 RegisterViewController
class RegisterViewController: UIViewController, RegisterViewControllerProtocol {
    weak var coordinator: AuthCoordinator?
    
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let usernameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let registerButton = UIButton(type: .system)
    private let cancelButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "회원가입"
        view.backgroundColor = .systemBackground
        
        // Configure UI components
        titleLabel.text = "새 계정 만들기"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        
        usernameTextField.placeholder = "사용자명"
        usernameTextField.borderStyle = .roundedRect
        
        emailTextField.placeholder = "이메일"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        confirmPasswordTextField.placeholder = "비밀번호 확인"
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.isSecureTextEntry = true
        
        registerButton.setTitle("가입하기", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 8
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        // Setup stack view
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        // Add components to stack view
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(cancelButton)
        
        // Add stack view to main view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Set constraints
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func registerButtonTapped() {
        didTapRegisterCompleteButton()
    }
    
    @objc private func cancelButtonTapped() {
        didTapCancelButton()
    }
    
    // MARK: - RegisterViewControllerProtocol
    func didTapRegisterCompleteButton() {
        // 실제로는 사용자 입력 유효성 검사 후 회원가입 처리
        coordinator?.didFinishRegister()
    }
    
    func didTapCancelButton() {
        navigationController?.popViewController(animated: true)
    }
}
