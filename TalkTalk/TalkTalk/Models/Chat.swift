//
//  Chat.swift
//  TalkTalk
//
//  Created by 이종선 on 3/29/25.
//

import Foundation

struct Chat {
    let id: String
    let name: String?
    let participants: [String] // User IDs
    let isGroup: Bool
    let lastMessage: Message?
    let createdAt: Date
}
