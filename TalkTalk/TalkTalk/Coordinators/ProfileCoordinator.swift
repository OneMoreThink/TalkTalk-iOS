//
//  ProfileCoordinator.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

/// 프로필 화면을 관리하는 Coordinator
class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let viewControllerFactory: ViewControllerFactory
    
    init(navigationController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func start() {
        let profileVC = viewControllerFactory.makeProfileViewController()
        profileVC.coordinator = self
        navigationController.setViewControllers([profileVC], animated: false)
    }
    
    func showEditProfile() {
        let editProfileVC = viewControllerFactory.makeEditProfileViewController()
        editProfileVC.coordinator = self
        navigationController.pushViewController(editProfileVC, animated: true)
    }
    
    func showSettings() {
        let settingsVC = viewControllerFactory.makeSettingsViewController()
        settingsVC.coordinator = self
        navigationController.pushViewController(settingsVC, animated: true)
    }
    
    func logout() {
        // 로그아웃 처리 (알림 전송)
        NotificationCenter.default.post(name: NSNotification.Name("LogoutNotification"), object: nil)
    }
}
