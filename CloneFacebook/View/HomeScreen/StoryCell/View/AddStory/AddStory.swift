//
//  AddStory.swift
//  CloneFacebook
//
//  Created by TungLe on 02/05/2023.
//

import UIKit

class AddStory: UICollectionViewCell {
    @IBOutlet weak var viewBottomView: UIView!
    @IBOutlet weak var imgAddbutton: UIImageView!
    @IBOutlet weak var imgUserAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
    }
    func settingView() {
        imgAddbutton.layer.cornerRadius = imgAddbutton.frame.height/2
        imgAddbutton.layer.borderWidth = CGFloat(1)
        imgAddbutton.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        imgUserAvatar.layer.cornerRadius = 10
        
       // viewBottomView.clipsToBounds = true
        viewBottomView.layer.cornerRadius = 10
        viewBottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        viewBottomView.layer.borderWidth = CGFloat(0.2)
        let imageName = UserDefaults.standard.string(forKey: StringUserDefault.userImageName)
        imgUserAvatar.image = UIImage(named: imageName != nil ? imageName! : "" )
    }

}
