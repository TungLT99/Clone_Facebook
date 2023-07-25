//
//  InteractPostTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/12/23.
//

import UIKit
struct InteractButtonCollectionViewItem {
    var nameImage : String?
    var titleButton : String?
}
class InteractPostTableViewCell: UITableViewCell {
    let numberButton = 3
    var heightCell = CGFloat(40)
    let arrDataButton = [InteractButtonCollectionViewItem(nameImage: "https://img.icons8.com/?size=512&id=24816&format=png",titleButton: "Like"),
        InteractButtonCollectionViewItem(nameImage: "https://img.icons8.com/?size=512&id=11167&format=png",titleButton: "Comment"),
        InteractButtonCollectionViewItem(nameImage: "https://img.icons8.com/?size=512&id=11504&format=png",titleButton: "Share")]
    @IBOutlet weak var InteractPostCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func registerCollectionView() {
        InteractPostCollectionView.dataSource = self
        InteractPostCollectionView.delegate = self
        InteractPostCollectionView.register(UINib(nibName: "InteractButtonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InteractButtonCollectionViewCell")
    }
}

extension InteractPostTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberButton
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InteractButtonCollectionViewCell", for: indexPath) as! InteractButtonCollectionViewCell
        let button = arrDataButton[indexPath.row]
        cell.imageButton = button.nameImage!
        cell.titleButton = button.titleButton!
        cell.loadView()
        return cell
    }
}

extension InteractPostTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthCell : CGFloat?
        let numberButtonFloat = CGFloat(numberButton)
        widthCell = (screenSize.width - (20*2) ) / numberButtonFloat
        return CGSize(width: widthCell!, height: heightCell)
    }
}
