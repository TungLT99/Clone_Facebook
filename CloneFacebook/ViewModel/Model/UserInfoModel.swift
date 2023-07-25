//
//  UserInfoModel.swift
//  CloneFacebook
//
//  Created by TungLT on 6/28/23.
//

import Foundation
struct UserInfoModel {
    var bio: String?
    var urlAvatarImage: String?
    var urlCoverImage: String?
    var userNickname: String?
    var arrDetailInfo: [[String : String]]
    var arrFriend: [[String:String]]
    func toResult() -> UserInfoResult {
        return UserInfoResult(bio: bio,urlAvatarImage: urlAvatarImage,urlCoverImage: urlCoverImage,userNickname: userNickname,arrDetailInfo: arrDetailInfo,arrFriend: arrFriend)
    }
}
