//
//  AuthCoordinator.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

/// Coordinator 간 통신을 위한 프로토콜
protocol AuthCoordinatorDelegate: AnyObject {
    func didFinishAuth(_ coordinator: AuthCoordinator)
}

/// 인증 흐름 관리
class AuthCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: AuthCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        // 애니메이션과 함께 stack 교체
        navigationController.setViewControllers([loginVC], animated: true)
    }
    
    func goToRegister() {
        let registerVC = RegisterViewController()
        registerVC.coordinator = self
        navigationController.pushViewController(registerVC, animated: true)
    }
    
    func didFinishLogin() {
        delegate?.didFinishAuth(self)
    }
    
    func didFinishRegister() {
        delegate?.didFinishAuth(self)
    }
}
