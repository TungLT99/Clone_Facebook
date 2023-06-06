//
//  SignUpResponsitory.swift
//  CloneFacebook
//
//  Created by TungLT on 6/5/23.
//

import Foundation
import FirebaseAuth
protocol SignUpResponsitory {
    func signUpUser(username: String, password: String, completion: @escaping () -> Void, error: @escaping (_ error: Error) -> Void)
}

final class SignUpResponsitoryImp : SignUpResponsitory {
    func signUpUser(username: String, password: String, completion: @escaping () -> Void, error: @escaping (_ error: Error) -> Void) {
        Auth.auth().createUser(withEmail: username, password: password) { authDataResult, errorResult in
            guard errorResult == nil else {return error(errorResult!)}
            //SIgnup Successfully
            completion()
        }
    }
}
