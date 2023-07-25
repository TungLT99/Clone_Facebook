//
//  TabButtonTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/5/23.
//

import UIKit

class TabButtonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var tabButtonCollectionView: UICollectionView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        registerCollectionView()
    }
    func registerCollectionView() {
        tabButtonCollectionView.dataSource = self
        tabButtonCollectionView.register(UINib(nibName: "CellButtonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellButtonCollectionViewCell")
    }
    
}


extension TabButtonTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellButtonCollectionViewCell", for: indexPath) as! CellButtonCollectionViewCell
        return cell
    }
    
    
}
