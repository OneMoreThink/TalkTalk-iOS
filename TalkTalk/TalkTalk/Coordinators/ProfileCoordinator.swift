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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileVC = ProfileViewController()
        profileVC.coordinator = self
        navigationController.setViewControllers([profileVC], animated: false)
    }
    
    func showEditProfile() {
        let editProfileVC = EditProfileViewController()
        editProfileVC.coordinator = self
        navigationController.pushViewController(editProfileVC, animated: true)
    }
    
    func showSettings() {
        let settingsVC = SettingsViewController()
        settingsVC.coordinator = self
        navigationController.pushViewController(settingsVC, animated: true)
    }
    
    func logout() {
        // 로그아웃 처리 (알림 전송)
        NotificationCenter.default.post(name: NSNotification.Name("LogoutNotification"), object: nil)
    }
}
