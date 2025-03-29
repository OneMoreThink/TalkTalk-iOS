//
//  SceneDelegate.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 윈도우 생성
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        // 앱 코디네이터 생성 및 시작
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        // 로그아웃 옵저버 설정
        setupLogoutObserver()
    }
    
    private func setupLogoutObserver() {
        // 로그아웃 noti 관찰
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleLogout),
            name: NSNotification.Name("LogoutNotification"),
            object: nil
        )
    }
    
    @objc private func handleLogout() {
        // 로그아웃 시 coordinator 재설정
        if let window = self.window {
            appCoordinator = nil
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


