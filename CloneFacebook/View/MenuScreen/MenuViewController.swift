//
//  MenuViewController.swift
//  CloneFacebook
//
//  Created by TungLT on 6/13/23.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var settingBarButton: UIBarButtonItem!
    @IBOutlet weak var searchBarButton: UIBarButtonItem!
    let menuViewModel = MenuViewModel()
    @IBAction func didTapLogOutButton(_ sender: Any) {
        menuViewModel.didTapLogOutButton { [weak self] in
            if let loginViewController = self?.storyboard?.instantiateViewController(withIdentifier: "LoginScreen") {
                let window = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }.first
                let nav = UINavigationController(rootViewController: loginViewController)
                window?.rootViewController = nav
            }
        } error: { err in
            print(err.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
