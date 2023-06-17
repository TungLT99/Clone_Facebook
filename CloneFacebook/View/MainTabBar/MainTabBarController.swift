//
//  MainTabBarController.swift
//  CloneFacebook
//
//  Created by TungLT on 6/14/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    static let shared = MainTabBarController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}
