//
//  PostImageTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/12/23.
//

import UIKit
import SDWebImage

class PostImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    var urlImage = ""
    let constRange = CGFloat(0)
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var imagePost: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imagePost.sd_setImage(with: URL(string: urlImage))
        self.imageWidth.constant = screenSize.width - 2 * constRange
    }
    
}
