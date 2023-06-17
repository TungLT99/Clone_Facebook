//
//  LoginScreen.swift
//  CloneFacebook
//
//  Created by TungLe on 07/05/2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class LoginScreen: UIViewController {
    @IBOutlet weak var errorTextView: UIView!
    @IBOutlet weak var textErrorLabel: UILabel!
    @IBOutlet weak var textSignUpLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    var loginViewModel = LoginViewModel()

    @IBAction func userNameTextFieldDidChange(_ sender: Any) {
        if let username = userNameTextField.text {
            loginViewModel.username = username
        }
    }
    @IBAction func passwordTextFieldDidChange(_ sender: Any) {
        if let password = passwordTextField.text {
            loginViewModel.password = password
        }
    }
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        loginViewModel.didTapLoginButton { [weak self] in
            weak var vc = self!.storyboard?.instantiateViewController(withIdentifier: "MainScreen")
            self!.navigationController?.pushViewController(vc!, animated: true)
        } error: { [weak self] error in
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default)
            alert.addAction(OK)
            self?.present(alert, animated: true)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        settingGesture()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.hidesBackButton = true
    }
    func settingView() {
        loginViewModel.checkCurrentUser { [weak self] in
            weak var vc = self!.storyboard?.instantiateViewController(withIdentifier: "MainScreen")
            self!.navigationController?.pushViewController(vc!, animated: true)
        }
        errorTextView.isHidden = true
    }
    func settingGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(sender: )))
        textSignUpLabel.isUserInteractionEnabled = true
        textSignUpLabel.addGestureRecognizer(tapGesture)

    }
    @objc func didTapGesture(sender: UITapGestureRecognizer) {
        weak var vc = storyboard?.instantiateViewController(withIdentifier: "SignUpScreen") as? SignUp
        if let strongVc = vc {
            navigationController?.pushViewController(strongVc, animated: true)
        }
        
    }
    



}
