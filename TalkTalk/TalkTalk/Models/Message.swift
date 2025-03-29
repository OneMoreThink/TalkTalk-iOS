//
//  Message.swift
//  TalkTalk
//
//  Created by 이종선 on 3/29/25.
//

import Foundation

struct Message {
    let id: String
    let chatId: String
    let senderId: String
    let content: String
    let timestamp: Date
    let isRead: Bool
}
