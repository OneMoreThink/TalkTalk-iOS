//
//  DependencyContainer.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//

import Foundation

final class DependencyContainer {
    // 싱글턴 인스턴스 저장소
    private var singletons: [String: Any] = [:]
    
    // 팩토리 등록 저장소
    private var factories: [String: Any] = [:]
    
    // 타입 등록 (싱글턴)
    func register<T>(_ type: T.Type, instance: T) {
        let key = String(describing: type)
        singletons[key] = instance
    }
    
    // 타입 등록 (팩토리)
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        factories[key] = factory
    }
    
    // 매개변수가 있는 타입 등록
    func register<T, U>(_ type: T.Type, factory: @escaping (U) -> T) {
        let key = String(describing: type) + "-with-arg"
        factories[key] = factory
    }
    
    // 여러 매개변수가 있는 타입 등록
    func register<T, U, V>(_ type: T.Type, factory: @escaping (U, V) -> T) {
        let key = String(describing: type) + "-with-2-args"
        factories[key] = factory
    }
    
    // 의존성 해결 (싱글턴 우선)
    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        
        // 싱글턴이 있으면 반환
        if let singleton = singletons[key] as? T {
            return singleton
        }
        
        // 팩토리로 생성
        if let factory = factories[key] as? () -> T {
            return factory()
        }
        
        return nil
    }
    
    // 매개변수가 있는 타입 해결
    func resolve<T, U>(_ type: T.Type, argument: U) -> T? {
        let key = String(describing: type) + "-with-arg"
        return (factories[key] as? (U) -> T)?(argument)
    }
    
    // 여러 매개변수가 있는 타입 해결
    func resolve<T, U, V>(_ type: T.Type, arguments: (U, V)) -> T? {
        let key = String(describing: type) + "-with-2-args"
        return (factories[key] as? (U, V) -> T)?(arguments.0, arguments.1)
    }
}
