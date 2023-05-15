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
    
   // let textNoHaveAccount = "Don't have an account ? "
  //  let textSignUp = "Sign up here."
  //  @IBOutlet weak var goToSignUpLabel: UILabel!
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        if let email = userNameTextField.text , let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if error != nil {
                    self!.textErrorLabel.text = "Check your username and password"
                    UIView.animate(withDuration: 2, delay: 0) {
                    self!.errorTextView.isHidden = false
                    }
                }
                else {
                    weak var vc = self!.storyboard?.instantiateViewController(withIdentifier: "MainScreen")
                    self!.navigationController?.pushViewController(vc!, animated: true)
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        settingGesture()
    }
    func settingView() {
        errorTextView.isHidden = true
    }
    func settingGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(sender: )))
        textSignUpLabel.isUserInteractionEnabled = true
        textSignUpLabel.addGestureRecognizer(tapGesture)

    }
    @objc func didTapGesture(sender: UITapGestureRecognizer) {
        weak var vc = storyboard?.instantiateViewController(withIdentifier: "SignUpScreen") as! SignUp
        if let strongVc = vc {
            navigationController?.pushViewController(strongVc, animated: true)
        }
        
    }
    



}
