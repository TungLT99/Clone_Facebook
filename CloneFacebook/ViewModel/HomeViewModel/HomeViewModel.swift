//
//  HomeViewModel.swift
//  CloneFacebook
//
//  Created by TungLT on 6/18/23.
//

import Foundation
class HomeViewModel {
    var homeUseCase: HomeUseCaseProtocol
    var arrayPostModel = [PostModel]()
    init() {
        let responsitory = HomeResponsitoryImp()
        homeUseCase = HomeUseCaseImp(responsitory: responsitory)
    }
    func GetAllPost(completion: @escaping () -> Void, error: @escaping (Error) -> Void) {
        self.arrayPostModel.removeAll()
        homeUseCase.getAllPost(completion: { [weak self] arrayPostResult in
            if let safeArrayPostResult = arrayPostResult {
                for post in safeArrayPostResult {
                    var postModel = post.toModel()
                    postModel.timeDisplay = (self?.CalculatorTimePost(stringDate: postModel.time))!
                    postModel.date = postModel.time.toDate()
                    self?.arrayPostModel.append(postModel)
                }
                self?.arrayPostModel.sort(by: {
                    $0.date! > $1.date!
                })
                completion()
            }
        }, error: error)
    }
    func CalculatorTimePost(stringDate: String) -> String {
        let dateConvert = stringDate.toDate()
        let dateNow: Date = Date()
        let timeInterval = dateNow.timeIntervalSince1970 - dateConvert.timeIntervalSince1970
        let timeSecond: Int = Int(timeInterval)
        switch timeSecond {
        case 0..<60:
            return "Just now"
        case 60..<3600:
            return String(timeSecond/60) + " minutes ago"
        case 3600..<86400:
            return String(timeSecond/3600) + " hours ago"
        case 86400..<2592000:
            return String(timeSecond/86400) + " days ago"
        case 2592000..<31104000:
            return String(timeSecond/2592000) + " months ago"
        case 31104000..<93312000:
            return String(timeSecond/31104000) + " years ago"
        default:
            return stringDate
        }
    }
}
