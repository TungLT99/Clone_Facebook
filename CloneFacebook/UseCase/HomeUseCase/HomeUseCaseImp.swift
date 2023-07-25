//
//  HomeUseCaseImp.swift
//  CloneFacebook
//
//  Created by TungLT on 6/18/23.
//

import Foundation
final class HomeUseCaseImp: HomeUseCaseProtocol {
    var responsitory: HomeResponsitoryImp?
    init(responsitory: HomeResponsitoryImp) {
        self.responsitory = responsitory
    }
    func getAllPost(completion: @escaping ([PostResult]?) -> Void, error: @escaping (Error) -> Void) {
        var arrayPostResult = [PostResult]()
        responsitory?.getAllPost(completion: { arrPostEntity in
            if let safeArrayPost = arrPostEntity {
                for post in safeArrayPost {
                    arrayPostResult.append(post.toResult())
                }
                completion(arrayPostResult)
            }
        }, error: error)
    }
}
