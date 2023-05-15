//
//  MainView.swift
//  CloneFacebook
//
//  Created by TungLe on 30/04/2023.
//

import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var tbvHomeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        registerCell()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension HomeView {
    func settingView() {
        tbvHomeTableView.dataSource = self
        let backButtonImage = UIImage(named: "Icon-Close")
        let backButton = UIBarButtonItem()
      //  backButton.image = backButtonImage
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
    }
    func registerCell() {
        tbvHomeTableView.register(UINib(nibName: "StatusCell", bundle: nil), forCellReuseIdentifier: "statusCell")
        tbvHomeTableView.register(UINib(nibName: "StoryCell", bundle: nil), forCellReuseIdentifier: "storyCell")
        tbvHomeTableView.register(UINib(nibName: "ContentCellNoImage", bundle: nil), forCellReuseIdentifier: "contentCellNoImage")
    }
}

extension HomeView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as! StatusCell
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as! StoryCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentCellNoImage", for: indexPath) as! ContentCellNoImage
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentCellNoImage", for: indexPath) as! ContentCellNoImage
            return cell
        default:
            return UITableViewCell()
        }
        
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
