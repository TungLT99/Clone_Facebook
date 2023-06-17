//
//  Date.swift
//  CloneFacebook
//
//  Created by TungLT on 6/15/23.
//

import Foundation
extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }

}
