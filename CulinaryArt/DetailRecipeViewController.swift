//
//  DetailRecipeViewController.swift
//  CulinaryArt
//
//  Created by Mac on 09/07/24.
//

import UIKit
import Kingfisher

class DetailRecipeViewController: UIViewController {
    
    var recipe : [Recipes] = []
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var cookingTimeLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var mealTypeLabel: UILabel!
    
    var instruction : String?
    var ingredients : String?
    var cookTimeMinutes : Int?
    var cuisine : String?
    var tags : String?
    var mealType : String?
    var foodImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        self.instructionLabel.text = instruction
        self.ingredientsLabel.text = ingredients
        self.cookingTimeLabel.text = "\(cookTimeMinutes ?? 0) mins"
        self.cuisineLabel.text = cuisine
        self.tagsLabel.text = tags
        self.mealTypeLabel.text = mealType
        self.image.kf.setImage(with: URL(string: foodImage!))
    }
    
}
