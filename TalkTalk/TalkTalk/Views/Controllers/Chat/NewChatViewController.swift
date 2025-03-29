//
//  NewChatViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

protocol NewChatViewControllerProtocol: CoordinatedViewController where CoordinatorType == ChatCoordinator {
    func didTapCreateButton(withUsers userIds: [String])
    func didTapCancelButton()
}

// 임시 NewChatViewController
class NewChatViewController: UIViewController {
    weak var coordinator: ChatCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "새 채팅"
        view.backgroundColor = .systemBackground
        
        // 간단한 UI 구성
        let createButton = UIButton(type: .system)
        createButton.setTitle("채팅 만들기", for: .normal)
        createButton.backgroundColor = .systemBlue
        createButton.setTitleColor(.white, for: .normal)
        createButton.layer.cornerRadius = 8
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createButton)
        
        NSLayoutConstraint.activate([
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            createButton.widthAnchor.constraint(equalToConstant: 200),
            createButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func createButtonTapped() {
        // 새 채팅 ID 생성
        let newChatId = "chat-\(Int.random(in: 1000...9999))"
        coordinator?.showChatDetail(chatId: newChatId)
    }
}
