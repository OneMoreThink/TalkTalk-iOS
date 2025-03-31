//
//  ChatDetailViewModel.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//

class ChatDetailViewModel {
    private let chatRepository: ChatRepository
    private let messageRepository: MessageRepository
    
    init(chatId: String,
         chatRepository: ChatRepository,
         messageRepository: MessageRepository) {
        self.chatRepository = chatRepository
        self.messageRepository = messageRepository
    }
}
