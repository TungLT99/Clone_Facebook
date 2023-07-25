//
//  ProfileResponsitory.swift
//  CloneFacebook
//
//  Created by TungLT on 6/27/23.
//

import Foundation
import FirebaseFirestore
protocol ProfileResponsitoryProtocol {
    func getUserInfo(completion: @escaping (UserInfoEntity) -> Void,error: @escaping (Error) -> Void)
    func getAllPost(userEmail: String, completion: @escaping () -> Void)
}
final class ProfileResponsitoryImp : ProfileResponsitoryProtocol {

    
    let db = Firestore.firestore()
    func getUserInfo(completion: @escaping (UserInfoEntity) -> Void, error: @escaping (Error) -> Void) {
        let docRef = db.collection("UserInfo").document(UserDefaults.standard.string(forKey: StringUserDefault.userEmail)!)
        docRef.getDocument(completion: { document, errorFirebase in
            if let errorFirebase = errorFirebase {
                error(errorFirebase)
            }
            else {
                if let document = document, document.exists {
                    let dataDescription = document.data()
                    if let safeData = dataDescription {
                        let userEmail = UserDefaults.standard.string(forKey: StringUserDefault.userEmail)
                        self.getAllPost(userEmail: userEmail!, completion: {
                            let userInfo = UserInfoEntity(bio: safeData[StringUserInfo.bio] as? String,urlAvatarImage: safeData[StringUserInfo.urlAvatarImage] as? String, urlCoverImage: safeData[StringUserInfo.urlCoverImage] as? String, userNickname: safeData[StringUserInfo.userNickname] as? String, arrDetailInfo: safeData[StringUserInfo.arrDetailInfo] as? [[String : String]], arrFriend: safeData[StringUserInfo.arrFriend] as? [[String: String]])
                            completion(userInfo)
                        })
                        
                    }
                }
            }
        })
    }
    func getAllPost(userEmail: String, completion: @escaping () -> Void) {
        let arrPost = [PostEntity]()
        db.collection("Post").whereField(StringPost.userEmail, isEqualTo: userEmail)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        print(data[StringPost.postContent] as! String)
                        
                    }
                    completion()
                }
        }
    }
    
    
}
