//
//  DetailUserTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/5/23.
//

import UIKit

class DetailUserTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var height: CGFloat = CGFloat(0)
    var arrData : [[String : String]]?
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    @IBOutlet weak var detailTableView: IntrinsicTableView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        registerTableView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.heightTableView.constant = self.detailTableView.intrinsicContentSize.height
    }
    func registerTableView() {
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: "CellDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "CellDetailTableViewCell")
    }
    func loadheight() {
        self.heightTableView.constant = self.detailTableView.intrinsicContentSize.height
    }
}

extension DetailUserTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let safeArrData = arrData {
            return safeArrData.count
        }
        else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDetailTableViewCell") as! CellDetailTableViewCell
        if let safeArr = arrData {
            loadheight()
            cell.detailData = safeArr[indexPath.row]
            cell.loadData()
        }
        return cell
    }
    
    
    
}

