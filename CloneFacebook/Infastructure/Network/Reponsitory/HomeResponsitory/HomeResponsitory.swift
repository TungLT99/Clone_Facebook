//
//  HomeResponsitory.swift
//  CloneFacebook
//
//  Created by TungLT on 6/18/23.
//

import Foundation
import FirebaseFirestore
protocol HomeResponsitoryProtocol {
    func getAllPost(completion: @escaping ([PostEntity]?) -> Void, error: @escaping (Error) -> Void)
}

final class HomeResponsitoryImp: HomeResponsitoryProtocol {
    let db = Firestore.firestore()
    func getAllPost(completion: @escaping ([PostEntity]?) -> Void, error: @escaping (Error) -> Void) {
        var arrayDataPost = [PostEntity]()
        let queueGetDataPost = DispatchQueue(label: "queueGetDataPost",attributes: .concurrent)
        
        let fletchGroupDone = DispatchGroup()
        db.collection("Post").getDocuments { [weak self] querySnapshot, errorFirebase in
            if let err = errorFirebase {
                error(err)
            } else {
                if let safeQuerySnapshot = querySnapshot {
                    
                    for document in safeQuerySnapshot.documents {
                        fletchGroupDone.enter()
                        let fletchGroup = DispatchGroup()
                        var user = UserEntity()
                        var postAudience = PostAudienceEntity()
                        let dictionaryData = document.data()
                        let dicData: [String: Any] = dictionaryData
                        fletchGroup.enter()
                        queueGetDataPost.async {
                            let docRef = self?.db.collection("User").document(dicData["userEmail"] as! String)
                            if let docRef = docRef {
                                docRef.getDocument { (document, error) in
                                    if let document = document, document.exists {
                                        let dataDescription = document.data()
                                        user.updateInfo(name: dataDescription![StringUserDefault.userName] as! String, nameImage: dataDescription![StringUserDefault.userImageName] as! String, emailLogin:  dataDescription![StringUserDefault.userEmail] as! String)
                                        fletchGroup.leave()
                                    } else {
                                        print("Document does not exist")
                                    }
                                }
                            }
                        }
                        fletchGroup.enter()
                        queueGetDataPost.async {
                            let docRef = self?.db.collection("PostAudience").document(dicData["audiencePost"] as! String)
                            if let docRef = docRef {
                                docRef.getDocument { (document, error) in
                                    if let document = document, document.exists {
                                        let dataDescription = document.data()
                                        postAudience.updateData(postAudience: dataDescription![StringPostAudience.postAudience] as? String,postAudienceImageName: (dataDescription![StringPostAudience.postAudienceImageName] as? String), postAudienceDetail: dataDescription![StringPostAudience.postAudienceDetail] as? String)
                                        fletchGroup.leave()
                                    } else {
                                        print("Document does not exist")
                                    }
                                }
                            }
                        }
                        fletchGroup.notify(queue: queueGetDataPost, execute: {
                               let post: PostEntity = PostEntity(contentPost: dicData["contentPost"] as! String, userEmail: dicData["userEmail"] as! String, timePost: dicData["timePost"] as! String, audiencePost: dicData["audiencePost"] as! String, user: user, postAudienceImage: postAudience.postAudienceImageName!)
                            arrayDataPost.append(post)
                            fletchGroupDone.leave()
                        })
                    }
                   
                   
                }
                fletchGroupDone.notify(queue: .global(qos: .utility), execute: {
                    completion(arrayDataPost)
                })
            }
            
        }
        
    }
    
}
