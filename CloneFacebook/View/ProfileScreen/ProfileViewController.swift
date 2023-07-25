//
//  ProfileViewController.swift
//  CloneFacebook
//
//  Created by TungLT on 6/26/23.
//

import UIKit
import SDWebImage
class ProfileViewController: UIViewController {
    @IBOutlet weak var profileMainTableView: UITableView!
    let profileViewModel = ProfileViewModel()
    var arrDataDetail : [[String:String]]?
    var arrFriend : [[String:String]]?
    var arrPost : [PostModel]?
    var post = PostModel(content: "This is content Post", user: "Taki", time: "2023/07/17", postAudience: "Public", userModel: UserModel(userEmail: "testuser01@gmail.com",userName: "Taki",userNameImage: "https://i.pinimg.com/736x/c5/10/27/c51027e3cdfdfce5f21344a00dbb1bb0.jpg"), postAudienceImage: "https://img.icons8.com/?size=512&id=3685&format=png", arrImage: ["https://e0.pxfuel.com/wallpapers/412/935/desktop-wallpaper-kimi-no-na-wa-background-lake-your-name-anime.jpg"])
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        profileViewModel.getUserInfo(completion: {[weak self]  userInfoModel in
            self?.arrDataDetail = userInfoModel.arrDetailInfo
            self?.arrFriend = userInfoModel.arrFriend
     //       self?.arrPost = userInfoModel.arr
            self?.profileMainTableView.reloadData()

        }, error: {err in
            
        })
    }
    override func viewWillAppear(_ animated: Bool) {
      
    }
    func settingView() {
        customBarButton()
        customTitle()
        registerTableView()
    }
    
}
///Custom bar button
extension ProfileViewController {
    func customBarButton() {
        let size = Double(24)
        //Create search button
        let searchImage = UIImage(named: "Icon-Search")
        let scaledSearchImage = searchImage?.resized(toSize: CGSize(width: size, height: size))
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(scaledSearchImage, for: .normal)
        searchButton.addTarget(self, action: #selector(didTapSearchBarButton(sender: )), for: .touchUpInside)
        let searchBarButton = UIBarButtonItem(customView: searchButton)
        //Create edit button
        let editImage = UIImage(named: "Icon-Edit")?.resized(toSize: CGSize(width: size, height: size))
        let editButton = UIButton(type: .custom)
        editButton.setImage(editImage, for: .normal)
        editButton.addTarget(self, action: #selector(didTapEditButton(sender:)), for: .touchUpInside)
        let editBarButton = UIBarButtonItem(customView: editButton)
        //Create justify menu button
        let justifyImage = UIImage(named: "Icon-JustifyMenu")?.resized(toSize: CGSize(width: size, height: size))
        let justifyMenuButton = UIButton(type: .custom)
        justifyMenuButton.setImage(justifyImage, for: .normal)
        justifyMenuButton.addTarget(self, action: #selector(didTapMenuButton(sender:)), for: .touchUpInside)
        let justifyMenuBarButton = UIBarButtonItem(customView: justifyMenuButton)
        //add button to right navigator
        navigationItem.setRightBarButtonItems([searchBarButton,editBarButton], animated: true)
        //add button to left navigator
        navigationItem.setLeftBarButton(justifyMenuBarButton, animated: true)
    }
    @objc func didTapSearchBarButton(sender: UIBarButtonItem) {
        print("tap search")
    }
    @objc func didTapEditButton(sender: UIBarButtonItem) {
        print("tap edit")
    }
    @objc func didTapMenuButton(sender: UIBarButtonItem) {
        print("tap menu")
    }
}
///Custom Titile
extension ProfileViewController {
    func customTitle() {
        navigationItem.title = self.profileViewModel.currentUserName
    }
}
/// Register
extension ProfileViewController {
    func registerTableView() {
        profileMainTableView.dataSource = self
        profileMainTableView.register(UINib(nibName: "AvatarTableViewCell", bundle: nil), forCellReuseIdentifier: "AvatarTableViewCell")
        profileMainTableView.register(UINib(nibName: "TabButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "TabButtonTableViewCell")
        profileMainTableView.register(UINib(nibName: "DetailInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailInfoCell")
        profileMainTableView.register(UINib(nibName: "DetailUserTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailUserTableViewCell")
        profileMainTableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendTableViewCell")
        profileMainTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        profileMainTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        
    }
}
/// Table View
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarTableViewCell") as! AvatarTableViewCell
            if let userInfoModel = profileViewModel.userInfoModel {
                cell.userName = UserDefaults.standard.string(forKey: StringUserDefault.userName)
                cell.userNickname = userInfoModel.userNickname
                cell.avatarUser = userInfoModel.urlAvatarImage
                cell.coverImage = userInfoModel.urlCoverImage
                cell.userBio = userInfoModel.bio
                cell.loadView()
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TabButtonTableViewCell") as! TabButtonTableViewCell
            return cell
        case 2:
            if let arrDataDetail = arrDataDetail {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailUserTableViewCell") as! DetailUserTableViewCell
                cell.arrData = arrDataDetail
                return cell
            }
            else {
                return UITableViewCell()
            }
        case 3:
            if let arrFriend = arrFriend {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
                cell.checkNumberFriend(arrData: arrFriend)
                cell.splitArray(arrRoot: arrFriend)
                cell.friendTableView.reloadData()
                return cell
            }
            else {
                return UITableViewCell()
            }
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell") as! StatusCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
            cell.post = post
            return cell
        }
    }
    
    
}

