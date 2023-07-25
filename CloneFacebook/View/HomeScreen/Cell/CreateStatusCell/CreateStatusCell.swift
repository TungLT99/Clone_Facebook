//
//  CreateStatusCell.swift
//  CloneFacebook
//
//  Created by TungLe on 01/05/2023.
//

import UIKit
protocol didTapBtnShareLevelDelegate {
    func didTapBtnShareLevel(index: Int)
}
class CreateStatusCell: UICollectionViewCell {
    var delegate: didTapBtnShareLevelDelegate?
    var newItem: CreatePostItem?
    var intIndex: Int?
    @IBAction func didTapBtnShareLevel(_ sender: Any) {
        guard delegate != nil else {return}
        if let index = intIndex {
            delegate?.didTapBtnShareLevel(index: index)
        }
        
    }
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblContentLabel: UILabel!
    @IBOutlet weak var btnShareLevel: UIButton!
    @IBOutlet weak var imgShareLevel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView(item: newItem)
    }
    func settingView(item: CreatePostItem?) {
        if let safeItem = item {
            //btnShareLevel.setTitle(safeItem.strTitle, for: .normal)
            lblContentLabel.text = safeItem.strTitle
            imgShareLevel.image = UIImage(named: safeItem.strNameImage)
        }
       // btnShareLevel.sizeToFit()
        mainView.layer.borderWidth = CGFloat(1)
        mainView.layer.cornerRadius = 4
    }

}
