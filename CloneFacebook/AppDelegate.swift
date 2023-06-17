//
//  AppDelegate.swift
//  CloneFacebook
//
//  Created by TungLe on 30/04/2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func checkSessionLogin() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let window = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }.first

        if UserDefaults.standard.string(forKey: StringUserDefault.userEmail) != nil {
            let tabBarViewController = storyBoard.instantiateViewController(withIdentifier: "MainScreen")
            let nav = UINavigationController(rootViewController: tabBarViewController)
            window?.rootViewController = nav
        } else {
            let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen")
            let nav = UINavigationController(rootViewController: loginViewController)
            window?.rootViewController = nav
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        checkSessionLogin()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}


