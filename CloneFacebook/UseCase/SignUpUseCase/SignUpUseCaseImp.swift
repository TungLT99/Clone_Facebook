//
//  SignUpUseCaseImp.swift
//  CloneFacebook
//
//  Created by TungLT on 6/5/23.
//

import Foundation
class SignUpUseCaseImp: SignUpUseCaseProtocol {
    private var responsitory : SignUpResponsitory?
    init(responsitory: SignUpResponsitory) {
        self.responsitory = responsitory
    }
    func signUp(username: String, password: String, completion: @escaping () -> Void, error: @escaping (Error) -> Void) {
        responsitory?.signUpUser(username: username, password: password, completion: completion, error: error)
    }

    
    
}
