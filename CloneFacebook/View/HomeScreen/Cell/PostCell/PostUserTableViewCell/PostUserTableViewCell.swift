//
//  PostUserTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/12/23.
//

import UIKit
import SDWebImage

class PostUserTableViewCell: UITableViewCell {
    var timePostString = ""
    var postAudience = ""
    var userNamePost = ""
    var userPostAvatar = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var postAudienceImage: UIImageView!
    @IBOutlet weak var timePost: UILabel!
    @IBOutlet weak var userPostName: UILabel!
    @IBOutlet weak var userPostAvatarImage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        settingView()
        timePost.text = timePostString
        postAudienceImage.sd_setImage(with: URL(string: postAudience))
        userPostName.text = userNamePost
        userPostAvatarImage.sd_setImage(with: URL(string: userPostAvatar))
    }
    func settingView() {
        self.userPostAvatarImage.layer.cornerRadius = userPostAvatarImage.frame.height/2
    }
    
}
