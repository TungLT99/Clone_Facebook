//
//  ListFriendTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/7/23.
//

import UIKit

class ListFriendTableViewCell: UITableViewCell {
    let height: CGFloat = 170
    var arrData : [[String: String]]?
    var numberCell = 3
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionView()
      //  setCollectionViewHeight()
    }

    @IBOutlet weak var heightCollectionViewCell: NSLayoutConstraint!
    @IBOutlet weak var listFriendCollectionView: UICollectionView!
    func registerCollectionView() {
        listFriendCollectionView.dataSource = self
        listFriendCollectionView.delegate = self
        listFriendCollectionView.register(UINib(nibName: "DetailFriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailFriendCollectionViewCell")
    }
    func setCollectionViewHeight() {
        heightCollectionViewCell.constant = height
    }
    
}

extension ListFriendTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailFriendCollectionViewCell", for: indexPath) as! DetailFriendCollectionViewCell
        if let safeArr = arrData {
            cell.friendInfo = safeArr[indexPath.row]
            cell.loadView()
        }
        return cell
    }
}
extension ListFriendTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let numberOfItem: CGFloat = 3
        let spacingToView: CGFloat = 5
        let width = (screenSize.width - (numberOfItem-1)*spacing - numberOfItem*spacingToView)/numberOfItem
        return CGSize(width: width, height: height)
    }
}
