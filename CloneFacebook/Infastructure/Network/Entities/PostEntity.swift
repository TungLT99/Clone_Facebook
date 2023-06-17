//
//  PostEntity.swift
//  CloneFacebook
//
//  Created by TungLT on 6/12/23.
//

import Foundation
struct PostEntity {
    var contentPost: String
    var userEmail: String
    var timePost: String
    var audiencePost: String
    
    func toResult() -> PostResult {
        return PostResult(contentPost: self.contentPost,
                          userEmail: self.userEmail,
                          timePost: self.timePost,
                          audiencePost: self.audiencePost)
    }
}

