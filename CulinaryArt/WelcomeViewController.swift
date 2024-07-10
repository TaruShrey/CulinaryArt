//
//  WelcomeViewController.swift
//  CulinaryArt
//
//  Created by Mac on 09/07/24.
//

import UIKit

class WelcomeViewController: UIViewController {

    var container : String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeIamge: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = container! + ", Let's explore recipes..!"
        welcomeIamge.image = UIImage(named: "WelcomeRecipe")
    }
    
    @IBAction func nextBtnClick(_ sender: Any) {
        self.shouldPerformSegue(withIdentifier: "goToNext", sender: self)
    }
    
}
