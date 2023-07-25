//
//  DetailFriendCollectionViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/10/23.
//

import UIKit
import SDWebImage

class DetailFriendCollectionViewCell: UICollectionViewCell {

    var friendInfo : [String:String]?
    var friendEmail : String?
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var detailFriendName: UILabel!
    @IBOutlet weak var detailFriendAvatarImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
        loadView()
    }
    func settingView() {
        viewMain.layer.cornerRadius = 10
        detailFriendAvatarImage.layer.cornerRadius = 10
    }
    func loadView() {
        if let friendInfo = friendInfo {
            self.detailFriendAvatarImage.sd_setImage(with: URL(string: friendInfo[StringUserInfo.friendAvatar]!))
            self.detailFriendName.text = friendInfo[StringUserInfo.friendName]
            self.friendEmail = friendInfo[StringUserInfo.friendEmail]
        }
    }

}
