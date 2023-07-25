//
//  ProfileUseCaseProtocol.swift
//  CloneFacebook
//
//  Created by TungLT on 6/27/23.
//

import Foundation
import UIKit
protocol ProfileUseCaseProtocol {
    func getUserInfo(completion: @escaping (UserInfoResult) -> Void, error: @escaping (Error) -> Void)
}
