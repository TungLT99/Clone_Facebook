//
//  PostAudienceResult.swift
//  CloneFacebook
//
//  Created by TungLT on 6/23/23.
//

import Foundation
struct PostAudienceResult {
    var postAudience: String
    var postAudienceImageName: String
    var postAudienceDetail: String
    
    func toModel() -> PostAudienceModel {
        return PostAudienceModel(postAudience: self.postAudience, postAudienceImageName: self.postAudienceImageName, postAudienceDetail: self.postAudienceImageName)
    }
}
