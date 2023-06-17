//
//  SignUp.swift
//  CloneFacebook
//
//  Created by TungLe on 07/05/2023.
//

import UIKit

class SignUp: UIViewController {
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var goToLoginScreenLabel: UILabel!
    @IBOutlet weak var nameUserTextField: UITextField!
    private var viewModel: SignUpViewModel = SignUpViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        settingGesture()
    }
    func settingGesture() {
        let myGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(sender:)))
        goToLoginScreenLabel.addGestureRecognizer(myGesture)
        goToLoginScreenLabel.isUserInteractionEnabled = true
    }
    @objc func didTapGesture(sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func usernameChangeValueTextField(_ sender: Any) {
        viewModel.username = UsernameTextField.text!
    }
    
    @IBAction func passwordChangeValueTextField(_ sender: Any) {
        viewModel.password = PasswordTextField.text!
    }
    
    @IBAction func retypePasswordChangeValueTextField(_ sender: Any) {
        viewModel.retypePassword = retypePasswordTextField.text!
    }
    
    @IBAction func nameUserChangeValueTextField(_ sender: Any) {
        viewModel.nameUser = nameUserTextField.text!
    }
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        let stringError = viewModel.didTapSignUpButton {
            self.navigationController?.popViewController(animated: true)
        } error: { e in
            let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
        if stringError != "" {
            let alert = UIAlertController(title: "Error", message: stringError, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
       
    }
    
}
