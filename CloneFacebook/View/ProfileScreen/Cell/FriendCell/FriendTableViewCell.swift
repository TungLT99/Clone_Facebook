//
//  FriendTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/7/23.
//

import UIKit
protocol Test {
    func didLoad()
}

let screenSize: CGRect = UIScreen.main.bounds
class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var heightOfFriendTableView: NSLayoutConstraint!
    var arrData : [[String:String]]?
    var arrFriend1: [[String:String]] = [[String:String]]()
    var arrFriend2: [[String:String]] = [[String:String]]()
    var blHaveFullCell : Bool = true
    override func awakeFromNib() {
        super.awakeFromNib()
        registerTableView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        loadHeight()
    }
    @IBOutlet weak var friendTableView: IntrinsicTableView!
    func registerTableView() {
        friendTableView.dataSource = self
        friendTableView.register(UINib(nibName: "FriendTitileTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendTitleTableViewCell")
        friendTableView.register(UINib(nibName: "ListFriendTableViewCell", bundle: nil), forCellReuseIdentifier: "ListFriendTableViewCell")
        friendTableView.register(UINib(nibName: "SeeAllFriendTableViewCell", bundle: nil), forCellReuseIdentifier: "SeeAllFriendTableViewCell")
    }
    func checkNumberFriend(arrData: [[String:String]]) {
        if arrData.count < 3 {
            self.blHaveFullCell = false
        }
        else {
            self.blHaveFullCell = true
        }
    }
    func splitArray(arrRoot: [[String:String]]) {
        if blHaveFullCell == true {
            for i in 0..<arrRoot.count {
                if i < 3 {
                    self.arrFriend1.append(arrRoot[i])
                } else {
                    self.arrFriend2.append(arrRoot[i])
                }
            }
        }
    }
    func loadHeight() {
        self.heightOfFriendTableView.constant = self.friendTableView.intrinsicContentSize.height
        print("height:  \(self.heightOfFriendTableView.constant)")
    }
}

extension FriendTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if blHaveFullCell == true {
            return 4
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        loadHeight()
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTitleTableViewCell") as! FriendTitileTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListFriendTableViewCell") as! ListFriendTableViewCell
                cell.arrData = arrFriend1
                cell.listFriendCollectionView.reloadData()
            return cell
        case 2:
            if blHaveFullCell == true {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ListFriendTableViewCell") as! ListFriendTableViewCell
                    cell.arrData = arrFriend2
                    cell.listFriendCollectionView.reloadData()
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SeeAllFriendTableViewCell") as! SeeAllFriendTableViewCell
                return cell
            }
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SeeAllFriendTableViewCell") as! SeeAllFriendTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
