//
//  Coordinator.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

/// Coordinator 패턴을 구현하기 위한 기본 프로토콜
/// 앱의 화면 흐름을 관리하고 뷰 컨트롤러 간 전환 로직을 캡슐화합니다.
protocol Coordinator: AnyObject {
    /// 현재 Coordinator가 관리하는 자식 Coordinator들의 배열
    /// 계층적 흐름 관리와 메모리 관리를 위해 사용됩니다.
    var childCoordinators: [Coordinator] { get set }
    
    /// Coordinator가 화면 전환에 사용하는 네비게이션 컨트롤러
    /// 뷰 컨트롤러 푸시, 팝 등의 전환을 담당합니다.
    var navigationController: UINavigationController { get set }
    
    /// Coordinator의 화면 흐름을 시작하는 메서드
    /// 일반적으로 첫 번째 뷰 컨트롤러를 네비게이션 스택에 추가합니다.
    func start()
}
