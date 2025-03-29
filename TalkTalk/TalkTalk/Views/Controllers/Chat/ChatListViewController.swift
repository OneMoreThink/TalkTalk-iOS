//
//  ChatListViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

protocol ChatListViewControllerProtocol: CoordinatedViewController where CoordinatorType == ChatCoordinator {
    func didSelectChat(chatId: String)
    func didTapNewChatButton()
}

// 임시 ChatListViewController
class ChatListViewController: UIViewController, ChatListViewControllerProtocol {
    weak var coordinator: ChatCoordinator?
    
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    
    // 목업 데이터
    private let chatList = [
        ("chat-1", "홍길동", "안녕하세요!", "10:30 AM"),
        ("chat-2", "그룹채팅", "회의는 몇 시인가요?", "어제"),
        ("chat-3", "김철수", "프로젝트 진행상황 어떻게 되나요?", "어제"),
        ("chat-4", "이영희", "주말에 만나요!", "2일 전")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "채팅"
        view.backgroundColor = .systemBackground
        
        // 네비게이션 바 버튼 설정
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(newChatButtonTapped)
        )
        
        // 테이블뷰 설정
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ChatCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        // 리프레시 컨트롤 설정
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        // 레이아웃 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func newChatButtonTapped() {
        didTapNewChatButton()
    }
    
    @objc private func refreshData() {
        // 실제로는 데이터 새로고침 로직 구현
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - ChatListViewControllerProtocol
    func didSelectChat(chatId: String) {
        coordinator?.showChatDetail(chatId: chatId)
    }
    
    func didTapNewChatButton() {
        coordinator?.showNewChat()
    }
}

// UITableView 확장
extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath)
        
        // 목업 데이터 가져오기
        let chatData = chatList[indexPath.row]
        
        // 셀 구성
        var content = cell.defaultContentConfiguration()
        content.text = chatData.1
        content.secondaryText = chatData.2
        
        // 시간 표시를 오른쪽 위에 표시
        if #available(iOS 14.0, *) {
            content.secondaryTextProperties.alignment = .justified
            content.prefersSideBySideTextAndSecondaryText = true
        }
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chatId = chatList[indexPath.row].0
        didSelectChat(chatId: chatId)
    }
}
