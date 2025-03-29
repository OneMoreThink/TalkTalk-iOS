//
//  LoginViewControllerProtocol.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

// 인증 화면 관련 프로토콜
protocol LoginViewControllerProtocol: CoordinatedViewController where CoordinatorType == AuthCoordinator {
    func didTapLoginButton()
    func didTapRegisterButton()
}

// 임시 LoginViewController
class LoginViewController: UIViewController, LoginViewControllerProtocol {
    weak var coordinator: AuthCoordinator?
    
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let registerButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "로그인"
        view.backgroundColor = .systemBackground
        
        // Configure UI components
        titleLabel.text = "RealTalk"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textAlignment = .center
        
        usernameTextField.placeholder = "사용자명"
        usernameTextField.borderStyle = .roundedRect
        
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        registerButton.setTitle("계정이 없으신가요? 지금 가입하세요", for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        // Setup stack view
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        // Add components to stack view
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(registerButton)
        
        // Add stack view to main view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Set constraints
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func loginButtonTapped() {
        didTapLoginButton()
    }
    
    @objc private func registerButtonTapped() {
        didTapRegisterButton()
    }
    
    // MARK: - LoginViewControllerProtocol
    func didTapLoginButton() {
        // 실제로는 사용자 입력 유효성 검사 후 로그인 처리
        coordinator?.didFinishLogin()
    }
    
    func didTapRegisterButton() {
        coordinator?.goToRegister()
    }
}
