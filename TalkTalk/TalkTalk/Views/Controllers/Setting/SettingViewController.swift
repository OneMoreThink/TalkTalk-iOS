//
//  SettingViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

protocol SettingsViewControllerProtocol: CoordinatedViewController where CoordinatorType == ProfileCoordinator {
    func didTapBackButton()
}

// 임시 SettingsViewController
class SettingsViewController: UIViewController {
    weak var coordinator: ProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "설정"
        view.backgroundColor = .systemBackground
        
        // 간단한 UI 구성
        let label = UILabel()
        label.text = "설정 화면입니다"
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
