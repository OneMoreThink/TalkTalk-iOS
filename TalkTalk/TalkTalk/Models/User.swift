//
//  User.swift
//  TalkTalk
//
//  Created by 이종선 on 3/29/25.
//

import Foundation

struct User {
    let id: String
    let username: String
    let email: String
    let profileImageURL: String?
    let status: UserStatus
    
    enum UserStatus: String {
        case online
        case offline
        case away
    }
}
