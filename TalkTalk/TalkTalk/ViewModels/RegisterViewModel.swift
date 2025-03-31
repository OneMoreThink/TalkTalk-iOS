//
//  RegisterViewModel.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//


class RegisterViewModel {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
}
