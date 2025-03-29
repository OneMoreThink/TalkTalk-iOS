//
//  MainCoordinator.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

// MainCoordinator.swift - 메인 앱 화면 흐름 관리
class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        // 채팅 탭
        let chatNavController = UINavigationController()
        let chatCoordinator = ChatCoordinator(navigationController: chatNavController)
        childCoordinators.append(chatCoordinator)
        chatCoordinator.start()
        
        // 프로필 탭
        let profileNavController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavController)
        childCoordinators.append(profileCoordinator)
        profileCoordinator.start()
        
        // 탭 설정
        chatNavController.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "message"), tag: 0)
        profileNavController.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person"), tag: 1)
        
        tabBarController.viewControllers = [chatNavController, profileNavController]
        
        navigationController.setViewControllers([tabBarController], animated: true)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}

