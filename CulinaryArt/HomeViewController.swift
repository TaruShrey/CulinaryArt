//
//  HomeViewController.swift
//  CulinaryArt
//
//  Created by Mac on 08/07/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeImage.image = UIImage(named: "FoodImage")
        captionLabel.text = "Savor The Flavors With This Incredible Recipes..!"
    }
}
