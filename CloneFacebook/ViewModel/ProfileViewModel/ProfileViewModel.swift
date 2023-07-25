//
//  ProfileViewModel.swift
//  CloneFacebook
//
//  Created by TungLT on 6/26/23.
//

import Foundation
import UIKit
class ProfileViewModel {
    var profileUseCase: ProfileUseCaseProtocol
    init() {
        let responsitory = ProfileResponsitoryImp()
        self.profileUseCase = ProfileUseCase(responsitory: responsitory)
    }
    let currentUserName = UserDefaults.standard.string(forKey: StringUserDefault.userName)
    let currentImageName = UserDefaults.standard.string(forKey: StringUserDefault.userImageName)
    var avatarUserImage : UIImage?
    var coverUserImage : UIImage?
    var userInfoModel : UserInfoModel?
    func getUserInfo(completion: @escaping (UserInfoModel) -> Void, error: @escaping (Error) -> Void) {
        profileUseCase.getUserInfo(completion: { userInfoResult in
            self.userInfoModel = userInfoResult.toModel()
            let arrData = userInfoResult.arrDetailInfo
            if let safeArrData = arrData {
                for n in safeArrData {
                    print(n["detailText"]!)
                    print(n["imageDetail"]!)
                }
            }
            
            completion(userInfoResult.toModel())
        }, error: error)
    }
    
}
