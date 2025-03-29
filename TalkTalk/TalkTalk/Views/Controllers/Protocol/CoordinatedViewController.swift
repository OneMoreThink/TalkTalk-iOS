//
//  CoordinatedViewController.swift
//  TalkTalk
//
//  Created by 이종선 on 3/28/25.
//

import UIKit

// 모든 화면에 공통으로 적용되는 기본 프로토콜
protocol CoordinatedViewController: UIViewController {
    associatedtype CoordinatorType: Coordinator
    var coordinator: CoordinatorType? { get set }
}
