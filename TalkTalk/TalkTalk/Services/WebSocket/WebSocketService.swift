//
//  WebSocketService.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//


protocol WebSocketService {

}

class DefaultWebSocketService: WebSocketService {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}
