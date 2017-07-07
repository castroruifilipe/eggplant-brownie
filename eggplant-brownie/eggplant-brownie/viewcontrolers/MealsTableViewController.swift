//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 04/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit


class MealsTableViewController: UITableViewController, AddMealDelegate {

    var meals = [Meal(name: "Eggplant brownie", happiness: 5),
                 Meal(name: "Zucchini Muffin", happiness: 3)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails(recognizer:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer) {
        if (recognizer.state == UIGestureRecognizerState.began) {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            
            if (indexPath == nil) {
                return
            }
            let row = indexPath!.row
            let meal = meals[row]
            
            RemoveMealView(controller: self).show(meal: meal,
                                                  handler: {action in
                                                                self.meals.remove(at: row)
                                                                self.tableView.reloadData()
                                                           })
        }
    }
    
    
    
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
}
