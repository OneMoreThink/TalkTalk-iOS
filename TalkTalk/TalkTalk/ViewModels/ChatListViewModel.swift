//
//  ChatListViewModel.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//

class ChatListViewModel {
    private let chatRepository: ChatRepository
    
    init(chatRepository: ChatRepository) {
        self.chatRepository = chatRepository
    }
}
