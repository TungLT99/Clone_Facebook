//
//  AvatarTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 6/28/23.
//

import UIKit
import SDWebImage
class AvatarTableViewCell: UITableViewCell {
    var avatarUser: String?
    var coverImage: String?
    var userName: String?
    var userNickname: String?
    var userBio: String?

    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var viewUpdateAvatar: UIView!
    @IBOutlet weak var viewUpdateCoverImage: UIView!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var userNicknameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var updateCoverImageView: UIImageView!
    @IBOutlet weak var updateAvatarImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func settingView() {
        avatarView.layer.cornerRadius = avatarView.frame.height/2
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
        viewUpdateCoverImage.layer.cornerRadius = viewUpdateCoverImage.frame.width/2
        viewUpdateAvatar.layer.cornerRadius = viewUpdateAvatar.frame.width/2
    }
    func loadView() {
        if let userName = userName , let avatarUser = avatarUser, let coverImage = coverImage, let userNickname = userNickname {
            usernameLabel.text = userName
            userNicknameLabel.text = userNickname
            avatarImageView.sd_setImage(with: URL(string: avatarUser), placeholderImage: UIImage(named: ""))
            coverImageView.sd_setImage(with: URL(string: coverImage), placeholderImage: UIImage(named: ""))
            if let bio = userBio {
                bioLabel.text = bio
            }
            else
            {
               // bioLabel.removeFromSuperview()
                bioLabel.isHidden = true
            }
        }
    }
    
}
