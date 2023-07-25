//
//  UserResult.swift
//  CloneFacebook
//
//  Created by TungLT on 6/18/23.
//

import Foundation
struct UserResult {
    var userEmail: String?
    var userName: String?
    var userNameImage: String?
    func toModel() -> UserModel {
        if let userEmail = self.userEmail, let userName = self.userName, let userNameImage = self.userNameImage {
            return UserModel(userEmail: userEmail,userName: userName,userNameImage: userNameImage)
        }
        return UserModel()
    }
    func toEntity() -> UserEntity {
        return UserEntity(userNameLogin: userEmail!,nameUser: userName!,nameImage: userNameImage!)
    }
}
