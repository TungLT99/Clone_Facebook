//
//  CreatePost.swift
//  CloneFacebook
//
//  Created by TungLe on 01/05/2023.
//

import UIKit

class CreatePost: UIViewController  {
    var arrData = [CreatePostItem]()
    var postAudience: PostAudience?
    let createPostItem = CreatePostItem(strNameImage: "1", strTitle: "1", strFunction: "")
    
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    @IBOutlet weak var btnPostButton: UIButton!
    @IBAction func didTapButtonPost(_ sender: Any) {
    }
    
    @IBOutlet weak var textContent: UITextView!
    @IBOutlet weak var imgImageUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var createPostCategoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        loadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        createPostCategoryCollectionView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }
    func settingView() {
        createPostCategoryCollectionView.dataSource = self
        createPostCategoryCollectionView.register(UINib(nibName: "CreateStatusCell", bundle: nil), forCellWithReuseIdentifier: "createStatusCell")
        createPostCategoryCollectionView.delegate = self
        imgImageUser.layer.cornerRadius = imgImageUser.frame.width/2
        btnPostButton.setTitle("Post", for: .normal)
        self.tabBarController?.tabBar.isHidden = true
        if let flowLayout = createPostCategoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
    }
    func loadData() {
        arrData = createPostItem.newData()
    }
 

}
extension CreatePost {
    func switchScreen(item: CreatePostItem?) {
        guard item != nil else {return}
        if let functionName: String = item?.strFunction {
            switch functionName {
            case StringConfig.FunctionNameCreatepost.shareName:
                weak var vc = storyboard?.instantiateViewController(withIdentifier: "UpdateShareLevel") as? UpdateShareLevel
                vc?.selectData = self.postAudience
                vc?.delegate = self
                navigationController?.pushViewController(vc!, animated: true)
            case StringConfig.FunctionNameCreatepost.albumName:
                weak var vc = storyboard?.instantiateViewController(withIdentifier: "SelectAlbumScreen")
                navigationController?.pushViewController(vc!, animated: true)
            case StringConfig.FunctionNameCreatepost.instagram:
                weak var vc = storyboard?.instantiateViewController(withIdentifier: "ShareToInstagram")
                navigationController?.pushViewController(vc!, animated: true)
            default:
                return
            }
        }
    }
}
extension CreatePost: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "createStatusCell", for: indexPath) as! CreateStatusCell
        cell.delegate = self
        cell.intIndex = indexPath.row
        if indexPath.row == 0 && self.postAudience != nil {
            cell.imgShareLevel.image = UIImage(named: (self.postAudience?.strImageName!)!)
            cell.lblContentLabel.text = postAudience?.strTitle
        }
        else {
            cell.settingView(item: arrData[indexPath.row])
        }

        return cell
        
    }
    
    
}

extension CreatePost: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item: CreatePostItem? = arrData[indexPath.row]
        self.switchScreen(item: item)
        }
    }

extension CreatePost: didTapBtnShareLevelDelegate {
    func didTapBtnShareLevel(index: Int) {
        let item: CreatePostItem?
        do {
            try item = arrData[index]
            switchScreen(item: item)
        } catch {
            print(error)
        }
    }
    
}

extension CreatePost: didTapButtonSavePostAudienceDelegate {
    func didTapButtonSavePostAudience(item: PostAudience) {
        self.postAudience = item
        createPostCategoryCollectionView.reloadData()
    }
    
    
}
