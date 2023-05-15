//
//  PostAudienceCell.swift
//  CloneFacebook
//
//  Created by TungLe on 07/05/2023.
//

import UIKit

class PostAudienceCell: UITableViewCell {

    @IBAction func didTapBtnRadio(_ sender: Any) {
       // btnRadioButton.isSelected.toggle()
    }
    @IBOutlet weak var btnRadioButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var postAudience:PostAudience?
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPostAudience: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        settingView(item: postAudience)
        // Configure the view for the selected state
    }
    func settingView(item: PostAudience?) {
        
        if let safeItem = item {
            lblTitle.text = safeItem.strTitle
            lblDetail.text = safeItem.strDetail
            imgPostAudience.image = UIImage(named: safeItem.strImageName!)
        }
    }
    
}
