//
//  UserInfoResult.swift
//  CloneFacebook
//
//  Created by TungLT on 6/28/23.
//

import Foundation
struct UserInfoResult {
    var bio: String?
    var urlAvatarImage: String?
    var urlCoverImage: String?
    var userNickname: String?
    var arrDetailInfo: [[String: String]]?
    var arrFriend: [[String: String]]?
    func toModel() -> UserInfoModel {
        return UserInfoModel(bio: bio,urlAvatarImage: urlAvatarImage,urlCoverImage: urlCoverImage,userNickname: userNickname,arrDetailInfo: arrDetailInfo!,arrFriend: arrFriend!)
    }
    func toEntity() -> UserInfoEntity {
        return UserInfoEntity(bio: bio,urlAvatarImage: urlAvatarImage,urlCoverImage: urlCoverImage,userNickname: userNickname,arrDetailInfo: arrDetailInfo,arrFriend: arrFriend)
    }
}
