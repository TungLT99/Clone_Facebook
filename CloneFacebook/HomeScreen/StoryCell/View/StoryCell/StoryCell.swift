//
//  StoryCell.swift
//  CloneFacebook
//
//  Created by TungLe on 02/05/2023.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var clvStoryCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func settingView() {
        clvStoryCollectionView.dataSource = self
        clvStoryCollectionView.register(UINib(nibName: "DetailStoryCell", bundle: nil),forCellWithReuseIdentifier: "detailStoryCell")
        clvStoryCollectionView.register(UINib(nibName: "AddStory", bundle: nil),forCellWithReuseIdentifier: "addStory")
        clvStoryCollectionView.delegate = self
    }
    
}
extension StoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        switch index {
        case 0: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addStory", for: indexPath) as! AddStory
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailStoryCell", for: indexPath) as! DetailStoryCell
                return cell
        }
       
    }
    
    
}

extension StoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200*1/1.6, height: 200)
    }
}
