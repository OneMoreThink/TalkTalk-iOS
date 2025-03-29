//
//  ProfileViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

protocol ProfileViewControllerProtocol: CoordinatedViewController where CoordinatorType == ProfileCoordinator {
    func didTapEditProfileButton()
    func didTapSettingsButton()
    func didTapLogoutButton()
}

// 임시 ProfileViewController
class ProfileViewController: UIViewController, ProfileViewControllerProtocol {
    weak var coordinator: ProfileCoordinator?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let statusLabel = UILabel()
    private let editProfileButton = UIButton(type: .system)
    private let settingsButton = UIButton(type: .system)
    private let logoutButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "프로필"
        view.backgroundColor = .systemBackground
        
        // 스크롤뷰 설정
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // 프로필 이미지 설정
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.backgroundColor = .systemGray4
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.image = UIImage(systemName: "person.fill")
        profileImageView.tintColor = .white
        profileImageView.contentMode = .scaleAspectFit
        
        // 라벨 설정
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "홍길동"
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .center
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "@hong"
        usernameLabel.font = UIFont.systemFont(ofSize: 16)
        usernameLabel.textColor = .systemGray
        usernameLabel.textAlignment = .center
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "온라인"
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .systemGreen
        statusLabel.textAlignment = .center
        
        // 버튼 설정
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        editProfileButton.setTitle("프로필 수정", for: .normal)
        editProfileButton.backgroundColor = .systemBlue
        editProfileButton.setTitleColor(.white, for: .normal)
        editProfileButton.layer.cornerRadius = 8
        editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.setTitle("설정", for: .normal)
        settingsButton.backgroundColor = .systemGray5
        settingsButton.setTitleColor(.label, for: .normal)
        settingsButton.layer.cornerRadius = 8
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.backgroundColor = .systemRed
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.layer.cornerRadius = 8
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        // 컨텐츠 뷰에 추가
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(editProfileButton)
        contentView.addSubview(settingsButton)
        contentView.addSubview(logoutButton)
        
        // 레이아웃 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            usernameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            statusLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            editProfileButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 32),
            editProfileButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            editProfileButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            editProfileButton.heightAnchor.constraint(equalToConstant: 44),
            
            settingsButton.topAnchor.constraint(equalTo: editProfileButton.bottomAnchor, constant: 16),
            settingsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            settingsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            settingsButton.heightAnchor.constraint(equalToConstant: 44),
            
            logoutButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 40),
            logoutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            logoutButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            logoutButton.heightAnchor.constraint(equalToConstant: 44),
            logoutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
    
    @objc private func editProfileButtonTapped() {
        didTapEditProfileButton()
    }
    
    @objc private func settingsButtonTapped() {
        didTapSettingsButton()
    }
    
    @objc private func logoutButtonTapped() {
        didTapLogoutButton()
    }
    
    // MARK: - ProfileViewControllerProtocol
    func didTapEditProfileButton() {
        coordinator?.showEditProfile()
    }
    
    func didTapSettingsButton() {
        coordinator?.showSettings()
    }
    
    func didTapLogoutButton() {
        // 로그아웃 확인 다이얼로그 표시
        let alert = UIAlertController(
            title: "로그아웃",
            message: "정말 로그아웃 하시겠습니까?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "로그아웃", style: .destructive, handler: { _ in
            self.coordinator?.logout()
        }))
        
        present(alert, animated: true)
    }
}
