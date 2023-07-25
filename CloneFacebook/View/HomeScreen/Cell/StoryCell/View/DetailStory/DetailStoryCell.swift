//
//  DetailStoryCell.swift
//  CloneFacebook
//
//  Created by TungLe on 02/05/2023.
//

import UIKit

class DetailStoryCell: UICollectionViewCell {

    @IBOutlet weak var imgUserAvatar: UIImageView!
    @IBOutlet weak var imgStoryImage: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
        // Initialization code
    }
    func settingView() {
        imgStoryImage.layer.cornerRadius = 10
        imgUserAvatar.layer.cornerRadius = imgUserAvatar.frame.height/2
        imgUserAvatar.layer.borderWidth = CGFloat(4)
        imgUserAvatar.layer.borderColor = CGColor(red: 0, green: 0, blue: 255, alpha: 1)
    }

}
