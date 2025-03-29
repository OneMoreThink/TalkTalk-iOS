//
//  EditProfileViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

protocol EditProfileViewControllerProtocol: CoordinatedViewController where CoordinatorType == ProfileCoordinator {
    func didTapSaveButton()
    func didTapCancelButton()
}

// 임시 EditProfileViewController
class EditProfileViewController: UIViewController {
    weak var coordinator: ProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "프로필 수정"
        view.backgroundColor = .systemBackground
        
        // 간단한 UI 구성
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("저장", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 8
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // 저장 버튼 네비게이션 바에 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "저장",
            style: .done,
            target: self,
            action: #selector(saveButtonTapped)
        )
    }
    
    @objc private func saveButtonTapped() {
        // 저장 처리 후 이전 화면으로 이동
        navigationController?.popViewController(animated: true)
    }
}
