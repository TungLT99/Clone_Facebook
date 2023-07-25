//
//  PostAudienceEntity.swift
//  CloneFacebook
//
//  Created by TungLT on 6/23/23.
//

import Foundation
struct PostAudienceEntity {
    var postAudience: String?
    var postAudienceImageName: String?
    var postAudienceDetail: String?
    mutating func updateData(postAudience: String? = nil, postAudienceImageName: String? = nil, postAudienceDetail: String? = nil) {
        self.postAudience = postAudience
        self.postAudienceImageName = postAudienceImageName
        self.postAudienceDetail = postAudienceDetail
    }
}
