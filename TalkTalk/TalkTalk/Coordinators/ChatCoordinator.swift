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
        let chatListVC = viewControllerFactory.makeChatListViewController()
        chatListVC.coordinator = self
        navigationController.setViewControllers([chatListVC], animated: false)
    }
    
    func showChatDetail(chatId: String) {
        let chatDetailVC = viewControllerFactory.makeChatDetailViewController(chatId: chatId)
        chatDetailVC.coordinator = self
        navigationController.pushViewController(chatDetailVC, animated: true)
    }
    
    func showNewChat() {
        let newChatVC = viewControllerFactory.makeNewChatViewController()
        newChatVC.coordinator = self
        navigationController.pushViewController(newChatVC, animated: true)
    }
}
