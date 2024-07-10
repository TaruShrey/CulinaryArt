//
//  Recipe.swift
//  CulinaryArt
//
//  Created by Mac on 08/07/24.
//

import Foundation

struct APIResponse{
    var recipes : [Recipes]
    var total : Int
    var skip : Int
    var limit : Int
}

struct Recipes{
    var id : Int
    var name : String
    var ingredients : [String]
    var instructions : [String]
    var prepTimeMinutes : Int
    var cookTimeMinutes : Int
    var servings : Int
    var difficulty : String
    var cuisine : String
    var caloriesPerServing : Int
    var tags : [String]
    var userId : Int
    var image : String
    var rating : Double
    var reviewCount : Int
    var mealType : [String]
}
