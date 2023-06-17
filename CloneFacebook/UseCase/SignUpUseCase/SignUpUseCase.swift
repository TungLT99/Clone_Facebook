//
//  SignUpUseCase.swift
//  CloneFacebook
//
//  Created by TungLT on 6/5/23.
//

import Foundation
protocol SignUpUseCaseProtocol {
    func signUp(username: String, password: String,name: String, completion: @escaping () -> Void, error: @escaping (Error) -> Void)
}
