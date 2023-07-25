//
//  UIImage.swift
//  CloneFacebook
//
//  Created by TungLT on 6/26/23.
//

import Foundation
import UIKit
extension UIImage {
    func resized(toSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        self.draw(in: CGRect(origin: .zero, size: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
