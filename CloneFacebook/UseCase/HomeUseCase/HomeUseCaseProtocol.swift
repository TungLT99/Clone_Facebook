//
//  HomeUseCaseProtocol.swift
//  CloneFacebook
//
//  Created by TungLT on 6/18/23.
//

import Foundation
protocol HomeUseCaseProtocol {
    func getAllPost(completion: @escaping ([PostResult]?) -> Void,error: @escaping (Error) -> Void)
}
