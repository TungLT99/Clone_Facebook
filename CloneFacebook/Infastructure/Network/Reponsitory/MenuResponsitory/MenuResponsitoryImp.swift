//
//  MenuResponsitory.swift
//  CloneFacebook
//
//  Created by TungLT on 6/13/23.
//

import Foundation
import FirebaseAuth
protocol MenuResponsitoryProtocol {
    func didTapLogOutButton(completion: @escaping () -> Void, error: @escaping (Error) -> Void)
}


final class MenuResponsitoryImp: MenuResponsitoryProtocol {
    func didTapLogOutButton(completion: @escaping () -> Void, error: @escaping (Error) -> Void) {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: StringUserDefault.userEmail)
            completion()
        } catch let e {
            error(e)
        }
    }
}
