//
//  IngredientTableViewController.swift
//  FoodTracker
//
//  Created by Kathryn Blair on 2018-10-18.
//  Copyright © 2018 Kathryn Blair. All rights reserved.
//

import UIKit
import os.log

class IngredientTableViewController: UITableViewController {
    //MARK: Properties
    
    var ingredients = [Ingredient]()
    var meal: Meal?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // when I have something telling me where I came from, do this this way.
        if let meal = meal {
            // I have the meal from the previous screen hopefully
            navigationItem.title = "Ingredients for \(meal.name)"
        }else{
            navigationItem.title = "Ingredients"
        }
        
        loadSampleIngredients()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Table cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "IngredientTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? IngredientTableViewCell else {
                fatalError("the dequeued cell is not an instance of IngredientTableViewCell")
            }
        
        let ingredient = ingredients[indexPath.row]

        cell.ingredientNameLabel.text = ingredient.name
        
        if(ingredient.amount != nil){
            cell.numberLabel.text = "\(String(describing: ingredient.amount!))"
        }
        
        if(ingredient.unit != nil){
            cell.unitLabel.text = "\(String(describing: ingredient.unit!))"
        }else{
         cell.unitLabel.text = ""
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
     @IBAction func onBackButton(_ sender: Any) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The IngredientTableViewController is not inside a navigation controller.")
        }
     }
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */
    
    //MARK: Actions
    //may want to re-implement this if I get the other thing working with saving it.

    
    
    //MARK: Private Methods
    
    //maybe here I can check which meal it is??? These are for Caprese Salad
    private func loadSampleIngredients(){
        //set up default ingredients. Can undo this if I put in an editing system.
        guard var ingredient1 = Ingredient(name: "chicken", amount:1.0, unit: Ingredient.Units.kg) else {
            fatalError("Unable to instantiate ingredient.")
        }
        
        guard var ingredient2 = Ingredient(name: "flour", amount:1.0, unit:Ingredient.Units.cups) else {
            fatalError("Unable to instantiate ingredient.")
        }
        
        guard var ingredient3 = Ingredient(name: "salt", amount:1, unit: Ingredient.Units.tsp) else {
            fatalError("Unable to instantiate ingredient.")
        }
        
        if(meal != nil) {
            if(meal?.name != nil){
                let mealName = meal?.name
                if(mealName?.range(of:"aprese") != nil){
                    
                    ingredient1.name = "bocconcini"
                    ingredient1.amount=4.0
                    ingredient1.unit=Ingredient.Units.oz
                    
                    ingredient2.name = "tomato"
                    ingredient2.amount = 1.0
                    ingredient2.unit = nil
                    
                    ingredient3.name = "fresh basil leaves"
                    ingredient3.amount = 0.25
                    ingredient3.unit = Ingredient.Units.cups
                    
                    ingredients += [ingredient1, ingredient2, ingredient3]
                } else if(mealName?.range(of:"hicken") != nil){
                    
                    ingredient1.name = "chicken"
                    ingredient1.amount=1.0
                    ingredient1.unit=Ingredient.Units.kg
                    
                    ingredient2.name = "potatoes"
                    ingredient2.amount = 1.0
                    ingredient2.unit = Ingredient.Units.kg
                    
                    ingredient3.name = "olive oil"
                    ingredient3.amount = 1
                    ingredient3.unit = Ingredient.Units.tbsp
                    
                    guard let ingredient4 = Ingredient(name: "rosemary", amount:1, unit: Ingredient.Units.tsp) else {
                        fatalError("Unable to instantiate ingredient.")
                    }
                    
                    ingredients += [ingredient1, ingredient2, ingredient3, ingredient4]
                }else if(mealName?.range(of:"asta") != nil){
                    ingredient1.name = "dry pasta"
                    ingredient1.amount=3.0
                    ingredient1.unit=Ingredient.Units.cups
                    
                    ingredient2.name = "meatballs"
                    ingredient2.amount = 1
                    ingredient2.unit = Ingredient.Units.kg
                    
                    ingredient3.name = "tomato sauce"
                    ingredient3.amount = 1
                    ingredient3.unit = Ingredient.Units.jar
                    
                    ingredients += [ingredient1, ingredient2, ingredient3]
                    
                }else{
                    ingredients += [ingredient1, ingredient2, ingredient3]
                }
            }
        }
        
    } // end loadSampleIngredients
    
}
