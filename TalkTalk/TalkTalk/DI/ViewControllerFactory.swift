//
//  ViewControllerFactory.swift
//  TalkTalk
//
//  Created by 이종선 on 3/31/25.
//

protocol ViewControllerFactory {
    func makeLoginViewController() -> LoginViewController
    func makeRegisterViewController() -> RegisterViewController
    func makeChatListViewController() -> ChatListViewController
    func makeChatDetailViewController(chatId: String) -> ChatDetailViewController
    func makeNewChatViewController() -> NewChatViewController
    func makeProfileViewController() -> ProfileViewController
    func makeEditProfileViewController() -> EditProfileViewController
    func makeSettingsViewController() -> SettingsViewController
}

class DefaultViewControllerFactory: ViewControllerFactory {
    private let container: DependencyContainer
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    func makeLoginViewController() -> LoginViewController {
        let viewModel = container.resolve(LoginViewModel.self)!
        let vc = LoginViewController()
        // viewModel 설정 코드는 생략
        return vc
    }
    
    func makeRegisterViewController() -> RegisterViewController {
        let viewModel = container.resolve(RegisterViewModel.self)!
        let vc = RegisterViewController()
        // viewModel 설정 코드는 생략
        return vc
    }
    
    func makeChatListViewController() -> ChatListViewController {
        let viewModel = container.resolve(ChatListViewModel.self)!
        let vc = ChatListViewController()
        // viewModel 설정 코드는 생략
        return vc
    }
    
    func makeChatDetailViewController(chatId: String) -> ChatDetailViewController {
        let viewModel = container.resolve(ChatDetailViewModel.self, argument: chatId)!
        let vc = ChatDetailViewController(chatId: chatId)
        // viewModel 설정 코드는 생략
        return vc
    }
    
    func makeNewChatViewController() -> NewChatViewController {
        return NewChatViewController()
    }
    
    func makeProfileViewController() -> ProfileViewController {
        let viewModel = container.resolve(ProfileViewModel.self)!
        let vc = ProfileViewController()
        // viewModel 설정 코드는 생략
        return vc
    }
    
    func makeEditProfileViewController() -> EditProfileViewController {
        let viewModel = container.resolve(EditProfileViewModel.self)!
        let vc = EditProfileViewController()
        // viewModel 설정 코드는 생략
        return vc
    }
    
    func makeSettingsViewController() -> SettingsViewController {
        return SettingsViewController()
    }
}
