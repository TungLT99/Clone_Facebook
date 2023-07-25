//
//  PostAudienceModel.swift
//  CloneFacebook
//
//  Created by TungLT on 6/23/23.
//

import Foundation
struct PostAudienceModel {
    var postAudience: String
    var postAudienceImageName: String
    var postAudienceDetail: String
    
    func toResult() -> PostAudienceResult {
        return PostAudienceResult(postAudience: self.postAudience, postAudienceImageName: self.postAudienceImageName, postAudienceDetail: self.postAudienceDetail)
    }
}
