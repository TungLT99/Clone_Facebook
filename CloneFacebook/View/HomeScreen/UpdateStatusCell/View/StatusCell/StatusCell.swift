//
//  StatusCell.swift
//  CloneFacebook
//
//  Created by TungLe on 30/04/2023.
//

import UIKit
protocol didTapUpdateStatusDelegate {
    func didTapButtonUpdate()
}
class StatusCell: UITableViewCell {
    var delegate: didTapUpdateStatusDelegate?
    var userModel = UserModel()
    @IBAction func didTapUpdateStatus(_ sender: Any) {
        if let safeDelegate = delegate {
            safeDelegate.didTapButtonUpdate()
        }
    }
    @IBOutlet weak var imgUserAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func settingView() {
        imgUserAvatar.image = UIImage(named: userModel.userNameImage)
        imgUserAvatar.layer.cornerRadius = imgUserAvatar.frame.height/2
        
    }
    
}
