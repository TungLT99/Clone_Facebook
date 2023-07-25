//
//  CreatePost.swift
//  CloneFacebook
//
//  Created by TungLe on 01/05/2023.
//

import UIKit
import SDWebImage
import FirebaseAuth
class CreatePost: UIViewController  {
    var arrData = [CreatePostItem]()
    var createPostViewModel = CreatePostViewModel()
    let createPostItem = CreatePostItem(strNameImage: "1", strTitle: "1", strFunction: "")
    
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    @IBOutlet weak var btnPostButton: UIButton!
    @IBAction func didTapButtonPost(_ sender: Any) {
        if let postContent = self.postContentTextField.text {
            createPostViewModel.uploadPost(postContent: postContent, postAudience: PostAudience(id: 1, strImageName: "", strTitle: "Public", strDetail: "")) { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            } error: { [weak self] error in
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default)
                alert.addAction(OK)
                self?.present(alert, animated: true)
            }

        }
    }
    @IBAction func postContentChangeTextField(_ sender: Any) {
    }
    
    @IBOutlet weak var postContentTextField: UITextField!
    @IBOutlet weak var imgImageUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var createPostCategoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        settingBarButton()
        loadData()
        createPostViewModel.getPostAudience(arrData: PostAudience.getDataPost())
    }
    override func viewWillAppear(_ animated: Bool) {
        createPostCategoryCollectionView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }
    func settingBarButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
    }
    func settingView() {
        imgImageUser.sd_setImage(with: URL(string: UserDefaults.standard.string(forKey: StringUserDefault.userImageName)!))
        lblUserName.text = UserDefaults.standard.string(forKey: StringUserDefault.userName)
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
                vc?.selectData = createPostViewModel.postAudience
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
        if indexPath.row == 0 && self.createPostViewModel.postAudience != nil {
            cell.imgShareLevel.image = UIImage(named: (self.createPostViewModel.postAudience?.strImageName!)!)
            cell.lblContentLabel.text = self.createPostViewModel.postAudience?.strTitle
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
        createPostViewModel.postAudience = item
     //   self.postAudience = item
        createPostCategoryCollectionView.reloadData()
    }
    
    
}
