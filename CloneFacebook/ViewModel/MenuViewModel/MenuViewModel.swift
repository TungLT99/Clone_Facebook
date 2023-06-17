//
//  MenuViewModel.swift
//  CloneFacebook
//
//  Created by TungLT on 6/13/23.
//

import Foundation
struct MenuViewModel {
    var menuUseCase: MenuUseCaseProtocol
    init() {
        let responsitory = MenuResponsitoryImp()
        menuUseCase = MenuUseCaseImp(responsitory: responsitory)
    }
    func didTapLogOutButton(completion: @escaping () -> Void, error: @escaping (Error) -> Void) {
        menuUseCase.didTapLogOutButton(completion: completion, error: error)
    }
}
