//
//  ProfileUseCaseImp.swift
//  CloneFacebook
//
//  Created by TungLT on 6/27/23.
//

import Foundation
import UIKit
final class ProfileUseCase: ProfileUseCaseProtocol {

    
    var responsitory : ProfileResponsitoryImp?
    init(responsitory: ProfileResponsitoryImp) {
        self.responsitory = responsitory
    }
    func getUserInfo(completion: @escaping (UserInfoResult) -> Void, error: @escaping (Error) -> Void) {
        responsitory?.getUserInfo(completion: { userInfoEntity in
            completion(userInfoEntity.toResult())
        } , error: error)
    }
    
    
}
