//
//  User.swift
//  CloneFacebook
//
//  Created by TungLe on 04/05/2023.
//

import Foundation
struct User {
    private let id: String?
    private let userNameLogin: String = ""
    private let passwordLogin: String = ""
    private let nameUser: String?
    private var arrPost: [Post]?
    private var arrInfo: [Info]?
    private var arrFriend: [Friend]?
}
