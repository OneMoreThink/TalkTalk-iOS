//
//  AppCoordinator.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

/// 앱의 최상위 Coordinator
/// 각 화면은 담당 Coordinator들이 관리하고 여기서는 Coordinator들을 관리
class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let window: UIWindow
    private let viewControllerFactory: ViewControllerFactory
    
    init(window: UIWindow,
         viewControllerFactory: ViewControllerFactory) {
        self.window = window
        self.navigationController = UINavigationController()
        self.viewControllerFactory = viewControllerFactory
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        // 로그인 상태에 따라 적절한 flow 보여주기
        if isUserLoggedIn() {
            showMainFlow()
        } else {
            showAuthFlow()
        }
    }
    
    private func isUserLoggedIn() -> Bool {
        // 실제로는 UserDefaults나 KeyChain 등에서 확인
        return false
    }
    
    private func showAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController, viewControllerFactory: viewControllerFactory)
        authCoordinator.delegate = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
    
    private func showMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, viewControllerFactory: viewControllerFactory)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}

extension AppCoordinator: AuthCoordinatorDelegate {
    func didFinishAuth(_ coordinator: AuthCoordinator) {
        // Child coordinator에서 AuthCoordinator 제거 후 메인 화면으로 이동
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showMainFlow()
    }
}
