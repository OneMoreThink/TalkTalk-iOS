//
//  ChatDetailViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

protocol ChatDetailViewControllerProtocol: CoordinatedViewController where CoordinatorType == ChatCoordinator {
    var chatId: String { get }
    func didTapBackButton()
}

// 임시 ChatDetailViewController
class ChatDetailViewController: UIViewController, ChatDetailViewControllerProtocol {
    weak var coordinator: ChatCoordinator?
    let chatId: String
    
    private let tableView = UITableView()
    private let messageInputView = UIView()
    private let messageTextField = UITextField()
    private let sendButton = UIButton(type: .system)
    
    // 목업 데이터
    private let messages = [
        "안녕하세요!",
        "반갑습니다.",
        "오늘 회의 몇 시인가요?",
        "2시에 시작합니다.",
        "알겠습니다. 참석하겠습니다."
    ]
    
    init(chatId: String) {
        self.chatId = chatId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // 채팅방 제목 설정 (실제로는 채팅방 이름으로 설정)
        title = "채팅 상세"
        view.backgroundColor = .systemBackground
        
        // 테이블뷰 설정
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MessageCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        // 메시지 입력 영역 설정
        messageTextField.placeholder = "메시지 입력..."
        messageTextField.borderStyle = .roundedRect
        
        sendButton.setTitle("전송", for: .normal)
        sendButton.backgroundColor = .systemBlue
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.layer.cornerRadius = 8
        
        // 레이아웃 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false
        messageInputView.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        view.addSubview(messageInputView)
        messageInputView.addSubview(messageTextField)
        messageInputView.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageInputView.topAnchor),
            
            messageInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageInputView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            messageInputView.heightAnchor.constraint(equalToConstant: 60),
            
            messageTextField.leadingAnchor.constraint(equalTo: messageInputView.leadingAnchor, constant: 16),
            messageTextField.centerYAnchor.constraint(equalTo: messageInputView.centerYAnchor),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),
            
            sendButton.trailingAnchor.constraint(equalTo: messageInputView.trailingAnchor, constant: -16),
            sendButton.centerYAnchor.constraint(equalTo: messageInputView.centerYAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 60),
            sendButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    // MARK: - ChatDetailViewControllerProtocol
    func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

// UITableView 확장
extension ChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        // 목업 메시지 가져오기
        let message = messages[indexPath.row]
        
        // 셀 구성
        var content = cell.defaultContentConfiguration()
        content.text = message
        
        // 짝수 인덱스는 내 메시지, 홀수 인덱스는 상대방 메시지
        if indexPath.row % 2 == 0 {
            content.textProperties.alignment = .justified
            cell.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        } else {
            content.textProperties.alignment = .natural
            cell.backgroundColor = UIColor.systemGray.withAlphaComponent(0.1)
        }
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        
        return cell
    }
}
