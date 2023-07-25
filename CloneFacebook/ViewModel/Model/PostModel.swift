//
//  Post.swift
//  CloneFacebook
//
//  Created by TungLT on 6/12/23.
//

import Foundation
struct PostModel {
    var content: String
    var user: String
    var time: String
    var postAudience: String
    var userModel: UserModel
    var timeDisplay: String = ""
    var postAudienceImage: String
    var date: Date?
    var arrImage : [String]?
    func toResult() -> PostResult {
        return PostResult(contentPost: self.content,
                          userEmail: self.user,
                          timePost: self.time,
                          audiencePost: self.postAudience, user: userModel.toResult(),postAudienceImage: self.postAudienceImage)
    }
}
