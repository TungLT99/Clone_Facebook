//
//  CreatePostUseCase.swift
//  CloneFacebook
//
//  Created by TungLT on 6/12/23.
//

import Foundation
protocol CreatePostUseCaseProtocol {
    func uploadPost(post: PostModel, completion: @escaping () -> Void, errorResult: @escaping (Error) -> Void)
}
