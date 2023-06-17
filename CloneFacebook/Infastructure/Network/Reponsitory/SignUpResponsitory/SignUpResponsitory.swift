//
//  SignUpResponsitory.swift
//  CloneFacebook
//
//  Created by TungLT on 6/5/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
protocol SignUpResponsitory {
    func signUpUser(username: String, password: String,name: String, completion: @escaping () -> Void, error: @escaping (_ error: Error) -> Void)
}

final class SignUpResponsitoryImp : SignUpResponsitory {
    let db = Firestore.firestore()
    func signUpUser(username: String, password: String,name: String, completion: @escaping () -> Void, error: @escaping (_ error: Error) -> Void) {
        Auth.auth().createUser(withEmail: username, password: password) { authDataResult, errorResult in
            guard errorResult == nil else {return error(errorResult!)}
            //Add new user
            self.db.collection("User").document(username).setData([
                StringUserDefault.userName : name,
                StringUserDefault.userEmail : username,
                StringUserDefault.userImageName : "defaultAvatar",
                StringUserDefault.defaultPostAudience : "Public"
            ]) { err in
                if let err = err {
                    //Fail
                    print(err)
                }
                else
                {
                    //Success
                }
                
            }
            completion()
        }
    }
}
