//
//  RecipesViewController.swift
//  CulinaryArt
//
//  Created by Mac on 08/07/24.
//

import UIKit
import Kingfisher

class RecipesViewController: UIViewController {
    
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?

    var recipe : [Recipes] = []
    private let identifier = "RecipesTableViewCell"
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXIB()
        initView()
        parseJSON()
    }
    
    func registerXIB(){
        let uiNib = UINib(nibName: identifier, bundle: nil)
        self.recipeTableView.register(uiNib, forCellReuseIdentifier: identifier)
    }
    
    func initView(){
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
    }
    
    func parseJSON(){
        
        url = URL(string: "https://dummyjson.com/recipes")
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!, completionHandler: { data, response, error in
            let jsonResponse = try! JSONSerialization.jsonObject(with: data!) as! [String : Any]
            
            let recipes = jsonResponse["recipes"] as! [[String: Any]]
            let total = jsonResponse["total"] as! Int
            let skip = jsonResponse["skip"] as! Int
            let limit = jsonResponse["limit"] as! Int
            
            for eachRecipe in recipes{
                let id = eachRecipe["id"] as! Int
                let name = eachRecipe["name"] as! String
                let ingredients = eachRecipe["ingredients"] as! [String]
                let instructions = eachRecipe["instructions"] as! [String]
                let prepTimeMinutes = eachRecipe["prepTimeMinutes"] as! Int
                let cookTimeMinutes = eachRecipe["cookTimeMinutes"] as! Int
                let servings = eachRecipe["servings"] as! Int
                let difficulty = eachRecipe["difficulty"] as! String
                let cuisine = eachRecipe["cuisine"] as! String
                let caloriesPerServing = eachRecipe["caloriesPerServing"] as! Int
                let tags = eachRecipe["tags"] as! [String]
                let userId = eachRecipe["userId"] as! Int
                let image = eachRecipe["image"] as! String
                let rating = eachRecipe["rating"] as! Double
                let reviewCount = eachRecipe["reviewCount"] as! Int
                let mealType = eachRecipe["mealType"] as! [String]
                
                let recipeObj = Recipes(id: id, name: name, ingredients: ingredients, instructions: instructions, prepTimeMinutes: prepTimeMinutes, cookTimeMinutes: cookTimeMinutes, servings: servings, difficulty: difficulty, cuisine: cuisine, caloriesPerServing: caloriesPerServing, tags: tags, userId: userId, image: image, rating: rating, reviewCount: reviewCount, mealType: mealType)
                
                self.recipe.append(recipeObj)
            }
            
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
            
        })
        
        dataTask?.resume()
        
    }
}
        

extension RecipesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailRecipeViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailRecipeViewController") as! DetailRecipeViewController
        
        detailRecipeViewController.ingredients = recipe[indexPath.row].ingredients.joined(separator: "\n")
        detailRecipeViewController.instruction = recipe[indexPath.row].instructions.joined(separator: "\n")
        detailRecipeViewController.cookTimeMinutes = recipe[indexPath.row].cookTimeMinutes
        detailRecipeViewController.cuisine = recipe[indexPath.row].cuisine
        detailRecipeViewController.tags = recipe[indexPath.row].tags.joined(separator: "\n")
        detailRecipeViewController.mealType = recipe[indexPath.row].mealType.joined(separator: "\n")
        detailRecipeViewController.foodImage = recipe[indexPath.row].image

        self.navigationController?.pushViewController(detailRecipeViewController, animated: true)
    }
}

extension RecipesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipesTableViewCell = self.recipeTableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as! RecipesTableViewCell
        
        recipesTableViewCell.idLabel.text = "Id :" + recipe[indexPath.row].id.codingKey.stringValue
        recipesTableViewCell.nameLabel.text = "Food Item : " + recipe[indexPath.row].name
        recipesTableViewCell.ratingLabel.text = "Ratings : " + String(recipe[indexPath.row].rating)
        recipesTableViewCell.calLabel.text = "Calories : " + recipe[indexPath.row].caloriesPerServing.codingKey.stringValue
        recipesTableViewCell.foodImage.kf.setImage(with: URL(string: recipe[indexPath.row].image))
        recipesTableViewCell.foodImage.layer.borderWidth = 2
        recipesTableViewCell.foodImage.layer.borderColor = UIColor.black.cgColor
        
        return recipesTableViewCell
    }
}
