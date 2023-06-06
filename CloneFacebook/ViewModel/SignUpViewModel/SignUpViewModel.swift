//
//  SignUpViewModel.swift
//  CloneFacebook
//
//  Created by TungLT on 6/5/23.
//

import Foundation
struct SignUpViewModel {
    var username: String = ""
    var password: String = ""
    var retypePassword: String = ""
    private let signUpUseCase: SignUpUseCaseProtocol
    init() {
        let reponsitory = SignUpResponsitoryImp()
        signUpUseCase = SignUpUseCaseImp(responsitory: reponsitory)
    }
    func didTapSignUpButton(completion: @escaping () -> Void, error: @escaping (Error) -> Void) {
        if password == retypePassword {
            signUpUseCase.signUp(username: username, password: password) {
                completion()
            } error: { e in
                error(e)
            }
        }
        else {
            let testError = "The password and retype password not correct"
        }
 
    }
    func didTapLoginLabel() {
        
    }
}


