//
//  DependencyRegistrar.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//


class DependencyRegistrar {
    private let container: DependencyContainer
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    func registerDependencies() {
        registerServices()
        registerStores()
        registerRepositories()
        registerViewModels()
        registerFactories()
    }
    
    private func registerServices() {
        // NetworkService
        container.register(NetworkService.self) {
            DefaultNetworkService()
        }
        
        // WebSocketService
        container.register(WebSocketService.self) {
            DefaultWebSocketService(networkService: self.container.resolve(NetworkService.self)!)
        }
    }
    
    private func registerStores() {
        // Stores (액터)
        container.register(UserStore.self) {
            UserStore()
        }
        
        container.register(ChatStore.self) {
            ChatStore()
        }
        
        container.register(MessageStore.self) {
            MessageStore()
        }
    }
    
    private func registerRepositories() {
        // Repositories
        container.register(UserRepository.self) {
            DefaultUserRepository(
                networkService: self.container.resolve(NetworkService.self)!,
                userStore: self.container.resolve(UserStore.self)!
            )
        }
        
        container.register(ChatRepository.self) {
            DefaultChatRepository(
                networkService: self.container.resolve(NetworkService.self)!,
                chatStore: self.container.resolve(ChatStore.self)!
            )
        }
        
        container.register(MessageRepository.self) {
            DefaultMessageRepository(
                networkService: self.container.resolve(NetworkService.self)!,
                webSocketService: self.container.resolve(WebSocketService.self)!,
                messageStore: self.container.resolve(MessageStore.self)!,
                userStore: self.container.resolve(UserStore.self)!
            )
        }
    }
    
    private func registerViewModels() {
        // ViewModels
        container.register(LoginViewModel.self) {
            LoginViewModel(userRepository: self.container.resolve(UserRepository.self)!)
        }
        
        container.register(RegisterViewModel.self) {
            RegisterViewModel(userRepository: self.container.resolve(UserRepository.self)!)
        }
        
        container.register(ChatListViewModel.self) {
            ChatListViewModel(chatRepository: self.container.resolve(ChatRepository.self)!)
        }
        
        container.register(ChatDetailViewModel.self) { (chatId: String) in
            ChatDetailViewModel(
                chatId: chatId,
                chatRepository: self.container.resolve(ChatRepository.self)!,
                messageRepository: self.container.resolve(MessageRepository.self)!
            )
        }
        
        container.register(ProfileViewModel.self) {
            ProfileViewModel(userRepository: self.container.resolve(UserRepository.self)!)
        }
        
        container.register(EditProfileViewModel.self) {
            EditProfileViewModel(userRepository: self.container.resolve(UserRepository.self)!)
        }
    }
    
    private func registerFactories() {
        // ViewControllerFactory
        container.register(ViewControllerFactory.self) {
            DefaultViewControllerFactory(container: self.container)
        }
    }
}
