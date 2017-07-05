//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 01/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func add(meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    var delegate: AddMealDelegate?
    var items = [Item(name: "Eggplant Brownie", calories: 10),
                 Item(name: "Zucchini Muffin", calories: 10),
                 Item(name: "Cookie", calories: 10),
                 Item(name: "Coconut oil", calories: 500),
                 Item(name: "Chocolate frosting", calories: 1000),
                 Item(name: "Chocolate chip", calories: 1000)]
    var selected = Array<Item>()
    

    @IBAction func add() {
        if (nameField == nil || happinessField == nil) {
            return
        }
        
        let name = nameField!.text
        let happinessS = happinessField!.text
        if (happinessS == nil || name == nil) {
            return
        }
        let happiness = Int(happinessS!)
        if (happiness == nil) {
            return
        }
        let meal = Meal(name: name!, happiness: happiness!)
        meal.items = selected
        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)!");
        
        if (delegate == nil) {
            return
        }
        delegate!.add(meal: meal)
        
        if let navigation = self.navigationController {
            navigation.popViewController(animated: true)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        var cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if (cell == nil) {
            return
        }
        if (cell!.accessoryType == UITableViewCellAccessoryType.none) {
            cell!.accessoryType = UITableViewCellAccessoryType.checkmark
            selected.append(items[indexPath.row])
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.none
            if let position = selected.index(of: items[indexPath.row]) {
                selected.remove(at: position)
            }
        }
    }
    

}

