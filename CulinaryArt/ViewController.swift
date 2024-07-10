//
//  ViewController.swift
//  CulinaryArt
//
//  Created by Mac on 08/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeImage.image = UIImage(named: "WelcomeRecipe")
        welcomeLabel.text = "Welcome to Culinary Arts..!"
    }
    
    @IBAction func logInBtn(_ sender: UIButton) {
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
    }
    
}

