//
//  ChatListCoordinator.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

/// 채팅 목록 화면을 관리하는 Coordinator
class ChatCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let viewControllerFactory: ViewControllerFactory
    
    init(navigationController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func start() {
        let chatListVC = ChatListViewController()
        chatListVC.coordinator = self
        navigationController.setViewControllers([chatListVC], animated: false)
    }
    
    func showChatDetail(chatId: String) {
        let chatDetailVC = ChatDetailViewController(chatId: chatId)
        chatDetailVC.coordinator = self
        navigationController.pushViewController(chatDetailVC, animated: true)
    }
    
    func showNewChat() {
        let newChatVC = NewChatViewController()
        newChatVC.coordinator = self
        navigationController.pushViewController(newChatVC, animated: true)
    }
}
