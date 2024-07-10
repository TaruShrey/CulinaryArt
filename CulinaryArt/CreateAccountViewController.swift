//
//  CreateAccountViewController.swift
//  CulinaryArt
//
//  Created by Mac on 08/07/24.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountBtnClick(_ sender: UIButton) {
        
        guard let name = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let error = error{
                print("error")
            }
            else{
                self.shouldPerformSegue(withIdentifier: "goToNext", sender: self)
            }
        }
        
        let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        
        welcomeViewController.container = name
        
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
