//
//  MenuUseCaseImp.swift
//  CloneFacebook
//
//  Created by TungLT on 6/13/23.
//

import Foundation
final class MenuUseCaseImp: MenuUseCaseProtocol {
    var responsitory: MenuResponsitoryImp?
    init(responsitory: MenuResponsitoryImp) {
        self.responsitory = responsitory
    }
    func didTapLogOutButton(completion: @escaping () -> Void, error: @escaping (Error) -> Void) {
        responsitory?.didTapLogOutButton(completion: completion, error: error)
    }
    
    
}
