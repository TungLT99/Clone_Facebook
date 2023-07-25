//
//  PostContentTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/12/23.
//

import UIKit

class PostContentTableViewCell: UITableViewCell {
    var contentPostText = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBOutlet weak var contentPost: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentPost.text = contentPostText
    }
    
}
