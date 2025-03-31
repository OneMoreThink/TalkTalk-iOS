//
//  MessageRepository.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//


protocol MessageRepository {

}

class DefaultMessageRepository: MessageRepository {
    private let networkService: NetworkService
    private let webSocketService: WebSocketService
    private let messageStore: MessageStore
    private let userStore: UserStore
    
    init(networkService: NetworkService,
         webSocketService: WebSocketService,
         messageStore: MessageStore,
         userStore: UserStore) {
        self.networkService = networkService
        self.webSocketService = webSocketService
        self.messageStore = messageStore
        self.userStore = userStore
    }
}
