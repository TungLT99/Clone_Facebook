//
//  CellDetailTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/5/23.
//

import UIKit
import SDWebImage

class CellDetailTableViewCell: UITableViewCell {
    var detailData : [String:String]?
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func loadData() {
        if let detailData = detailData {
            detailLabel.text = detailData["detailText"]
            detailImage.sd_setImage(with: URL(string: detailData["imageDetail"]!))
        }
    }
    
}
