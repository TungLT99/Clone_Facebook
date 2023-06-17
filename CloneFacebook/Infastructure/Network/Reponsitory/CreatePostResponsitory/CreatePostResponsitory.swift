//
//  CreatePostResponsitory.swift
//  CloneFacebook
//
//  Created by TungLT on 6/12/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
protocol CreatePostResponsitoryProtocol {
    func uploadPost(post: PostResult, completion: @escaping () -> Void, errorResult: @escaping (Error) -> Void)
}

final class CreatePostResponsitoryImp : CreatePostResponsitoryProtocol {
    let db = Firestore.firestore()
    func uploadPost(post: PostResult,completion: @escaping () -> Void, errorResult: @escaping (Error) -> Void) {
        let postEntity = post.toEntity()
            db.collection("Post").document().setData([
                "contentPost" : postEntity.contentPost,
                "audiencePost" : postEntity.audiencePost,
                "timePost" : postEntity.timePost,
                "userEmail" : postEntity.userEmail
            ]) { err in
                if err == nil {
                    completion()
                }
                else {
                    errorResult(err!)
                }
            }
    }
    
    
}
