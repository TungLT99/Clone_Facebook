//
//  MainView.swift
//  CloneFacebook
//
//  Created by TungLe on 30/04/2023.
//

import UIKit
import FirebaseAuth
class HomeView: UIViewController {
    var userViewModel = UserViewModel()
    var homeViewModel = HomeViewModel()
    var arrayPost = [PostModel]()
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getCurrenUser()
        customBarButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        settingView()
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension HomeView {
    func settingView() {
        homeTableView.dataSource = self
   //     homeTableView.delegate = self
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
        self.homeViewModel.GetAllPost {[weak self] in
                DispatchQueue.main.async {
                    self?.arrayPost = self?.homeViewModel.arrayPostModel ?? [PostModel]()
                    self?.homeTableView.reloadData()
                }
            } error: { err in
                
            }
        

    }
    func registerCell() {
        homeTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        homeTableView.register(UINib(nibName: "StoryCell", bundle: nil), forCellReuseIdentifier: "storyCell")
        homeTableView.register(UINib(nibName: "ContentCellNoImage", bundle: nil), forCellReuseIdentifier: "contentCellNoImage")
    }
    func getCurrenUser() {
        userViewModel.getCurrentUser(completion: {
            self.homeTableView.reloadData()
        })
    }
}

extension HomeView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPost.count + 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as! StatusCell
            cell.delegate = self
            if userViewModel.user != nil {
                cell.userModel = userViewModel.user!
            }
            cell.settingView()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as! StoryCell
            cell.clvStoryCollectionView.reloadData()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentCellNoImage", for: indexPath) as! ContentCellNoImage
            cell.loadPost(post: arrayPost[indexPath.row-2])
            return cell
        }
        
    }
}

///Custom bar button
extension HomeView {
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
        let addImage = UIImage(named: "Icon-Add")?.resized(toSize: CGSize(width: size, height: size))
        let addButton = UIButton(type: .custom)
        addButton.setImage(addImage, for: .normal)
        addButton.addTarget(self, action: #selector(didTapAddButton(sender:)), for: .touchUpInside)
        let addBarButton = UIBarButtonItem(customView: addButton)
        //Create justify menu button
        let messengerImage = UIImage(named: "Icon-Messenger")?.resized(toSize: CGSize(width: size, height: size))
        let messengerButton = UIButton(type: .custom)
        messengerButton.setImage(messengerImage, for: .normal)
        messengerButton.addTarget(self, action: #selector(didTapMessengerButton(sender:)), for: .touchUpInside)
        let messengerBarButton = UIBarButtonItem(customView: messengerButton)
        //Create spacing between barbutotn
        let spacing: CGFloat = 20
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        fixedSpace.width = spacing
        let barButton : [UIBarButtonItem] = [messengerBarButton, fixedSpace, searchBarButton,fixedSpace, addBarButton]
        self.navigationItem.setRightBarButtonItems(barButton, animated: true)
        
        
        //left bar button
        let sizeLogo: CGFloat = 80
        let image = UIImage(named: "Facebook-Logo")?.resized(toSize: CGSize(width: sizeLogo, height: sizeLogo))
        let facebookButton = UIButton(type: .custom)
        facebookButton.setImage(image, for: .normal)
        let facebookBarButton = UIBarButtonItem(customView: facebookButton)
        
        let menuImage = UIImage(named: "Icon-JustifyMenu")?.resized(toSize: CGSize(width: size, height: size))
        let menuButton = UIButton(type: .custom)
        menuButton.setImage(menuImage, for: .normal)
        menuButton.addTarget(self, action: #selector(didTapMenuButton(sender:)), for: .touchUpInside)
        let menuBarButton = UIBarButtonItem(customView: menuButton)
        self.navigationItem.setLeftBarButtonItems([menuBarButton,facebookBarButton], animated: true)
    }
    @objc func didTapSearchBarButton(sender: UIBarButtonItem) {
        print("tap search")
    }
    @objc func didTapAddButton(sender: UIBarButtonItem) {
        print("tap add")
    }
    @objc func didTapMessengerButton(sender: UIBarButtonItem) {
        print("tap messenger")
    }
    @objc func didTapMenuButton(sender: UIBarButtonItem) {
        print("tap menu")
    }
}

extension HomeView: didTapUpdateStatusDelegate {
    func didTapButtonUpdate() {
        print("didTapButton Send from home screen")
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreatePostScreen")
        if vc != nil {
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
}
