//
//  ButtonCell.swift
//  CloneFacebook
//
//  Created by TungLe on 02/05/2023.
//

import UIKit
protocol didTapLikeButtonDelegate {
    func didTapLikeButton(sender: UILongPressGestureRecognizer)
    func didChangeGesture(sender: UILongPressGestureRecognizer, cell: ButtonCell)
}
class ButtonCell: UICollectionViewCell {

    @IBOutlet weak var btnButton: UIButton!
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var imgButtonImage: UIImageView!
    var delegate: didTapLikeButtonDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView(strNameImage: "", strContent: "")
    }
    func settingView(strNameImage: String, strContent: String) {
        lblLabel.text = strContent
        imgButtonImage.image = UIImage(named: strNameImage)
        holdLabel()
    }
    func holdLabel() {
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(holdFunction(sender: )))
        longGesture.minimumPressDuration = TimeInterval(1)
        let longGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(holdFunction(sender: )))
        longGesture2.minimumPressDuration = TimeInterval(1)
        imgButtonImage.isUserInteractionEnabled = true
        imgButtonImage.addGestureRecognizer(longGesture2)
        lblLabel.isUserInteractionEnabled = true
        lblLabel.addGestureRecognizer(longGesture)
        
    }
    @objc func holdFunction(sender: UILongPressGestureRecognizer) {
        if delegate != nil && lblLabel.text! == "Like" {
            delegate?.didTapLikeButton(sender: sender)
            if sender.state == .changed {
                delegate?.didChangeGesture(sender: sender, cell: self)
            }
        }
    }
}
