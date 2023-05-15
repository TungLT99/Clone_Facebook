//
//  PostAudience.swift
//  CloneFacebook
//
//  Created by TungLe on 07/05/2023.
//

import Foundation
struct PostAudience {
    let id: Int
    let strImageName: String?
     let strTitle: String?
     let strDetail: String?
    
     static func getDataPost() -> [PostAudience] {
         var postAudience1 = PostAudience(id: 1, strImageName: "Icon-Public", strTitle: "Public", strDetail: "Anyone on or off Facebook")
         var postAudience2 = PostAudience(id: 2, strImageName: "Icon-Friend", strTitle: "Friends", strDetail: "Your friend on Facebook")
         var postAudience3 = PostAudience(id: 3, strImageName: "Icon-ExceptFriend", strTitle: "Friend Except", strDetail: "Except some of your friend")
         var postAudience4 = PostAudience(id: 4, strImageName: "Icon-SpecialFriend", strTitle: "Specific Friends", strDetail: "Someone")
         var postAudience5 = PostAudience(id: 5, strImageName: "Icon-Onlyme", strTitle: "Only me", strDetail: "Only me")
        var arrData = [PostAudience]()
        arrData.append(postAudience1)
        arrData.append(postAudience2)
        arrData.append(postAudience3)
        arrData.append(postAudience4)
        arrData.append(postAudience5)
        return arrData
    }
}
