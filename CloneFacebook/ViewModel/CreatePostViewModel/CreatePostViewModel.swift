//
//  CreatePostViewModel.swift
//  CloneFacebook
//
//  Created by TungLT on 6/12/23.
//

import Foundation
class CreatePostViewModel {
    var postContent: String?
    var userEmail: String?
    var timePost: String?
    var post : PostModel?
    var postAudience: PostAudience?
    var createPostUseCase : CreatePostUseCaseProtocol
    init() {
        let responsitory = CreatePostResponsitoryImp()
        createPostUseCase = CreatePostUseCaseImp(responsitory: responsitory)
    }
    func uploadPost(postContent: String, postAudience: PostAudience, completion: @escaping () -> Void, error: @escaping (Error) -> Void) {
        let time : String  = Date().toString()
        let postAudienceTitle: String?
        if let postAudienceCheck = self.postAudience?.strTitle {
            postAudienceTitle = postAudienceCheck
        }
        else {
            postAudienceTitle = UserDefaults.standard.string(forKey: StringUserDefault.defaultPostAudience)
        }
        if let userEmail = UserDefaults.standard.string(forKey: StringUserDefault.userEmail), let postAudienceFinal = postAudienceTitle {
            createPostUseCase.uploadPost(post: PostModel(content: postContent, user: userEmail, time: time, postAudience: postAudienceFinal), completion: completion, errorResult: error)
        }
       
    }
}
