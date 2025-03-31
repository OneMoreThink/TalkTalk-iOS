//
//  ChatRepository.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//


protocol ChatRepository {

}

class DefaultChatRepository: ChatRepository {
    private let networkService: NetworkService
    private let chatStore: ChatStore
    
    init(networkService: NetworkService, chatStore: ChatStore) {
        self.networkService = networkService
        self.chatStore = chatStore
    }
}
