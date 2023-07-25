//
//  InteractButtonCollectionViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/12/23.
//

import UIKit
import SDWebImage

class InteractButtonCollectionViewCell: UICollectionViewCell {
    var titleButton = ""
    var imageButton = ""
    @IBOutlet weak var interactPostButtonTitle: UILabel!
    @IBOutlet weak var interactPostButtonImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        interactPostButtonTitle.text = titleButton
        interactPostButtonImageView.sd_setImage(with: URL(string: imageButton))
    }
    func loadView() {
        interactPostButtonTitle.text = titleButton
        interactPostButtonImageView.sd_setImage(with: URL(string: imageButton))
    }

}
