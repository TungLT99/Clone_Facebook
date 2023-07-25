//
//  User.swift
//  CloneFacebook
//
//  Created by TungLe on 04/05/2023.
//

import Foundation
struct UserEntity {
     var userNameLogin: String = ""
     var nameUser: String = "Default Name"
     var nameImage: String = "defaultImage"
//    private var arrPost: [Post]?
//    private var info: Info = Info()
//    private var arrFriend: [Friend]?
    func returnNameUser() -> String {
        return self.nameUser
    }
    func returnUsernameLogin() -> String {
        return self.userNameLogin
    }
    func returnNameImage() -> String {
        return self.nameImage
    }
//    func returnUserInfo() -> Info {
//        return info
//    }
    mutating func updateInfo(name: String,nameImage: String,emailLogin: String) {
        self.nameImage = nameImage
        self.nameUser = name
        self.userNameLogin = emailLogin
    }
    func toResult() -> UserResult {
        return UserResult(userEmail: userNameLogin,userName: nameUser,userNameImage: nameImage)
    }
    
    
}
