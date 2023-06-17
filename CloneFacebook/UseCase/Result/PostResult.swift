//
//  PostResult.swift
//  CloneFacebook
//
//  Created by TungLT on 6/12/23.
//

import Foundation
struct PostResult {
    var contentPost: String
    var userEmail: String
    var timePost: String
    var audiencePost: String
    func toEntity() -> PostEntity{
        return PostEntity(contentPost: self.contentPost,
                          userEmail: self.userEmail,
                          timePost: self.timePost,
                          audiencePost: self.audiencePost)
    }
    
    func toModel() -> PostModel {
        return PostModel(content: self.contentPost,
                         user: self.userEmail,
                         time: self.timePost,
                         postAudience: self.audiencePost)
    }
}
