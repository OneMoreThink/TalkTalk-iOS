//
//  UserRepository.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//


protocol UserRepository {

}

class DefaultUserRepository: UserRepository {
    private let networkService: NetworkService
    private let userStore: UserStore
    
    init(networkService: NetworkService, userStore: UserStore) {
        self.networkService = networkService
        self.userStore = userStore
    }
}
