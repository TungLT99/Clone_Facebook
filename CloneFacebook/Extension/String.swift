//
//  String.swift
//  CloneFacebook
//
//  Created by TungLT on 6/22/23.
//

import Foundation
extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm:ss"
        let date = dateFormatter.date(from:self)!
        return date
    }
}
