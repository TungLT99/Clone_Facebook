//
//  CreatePostUseCaseImp.swift
//  CloneFacebook
//
//  Created by TungLT on 6/12/23.
//

import Foundation
final class CreatePostUseCaseImp: CreatePostUseCaseProtocol {
    var responsitory: CreatePostResponsitoryImp
    var post: PostEntity?
    init(responsitory: CreatePostResponsitoryImp) {
        self.responsitory = responsitory
    }
    func uploadPost(post: PostModel, completion: @escaping () -> Void, errorResult: @escaping (Error) -> Void) {
        var postResult = post.toResult()
        responsitory.uploadPost(post: postResult, completion: completion, errorResult: errorResult)
    }
    
    
}
