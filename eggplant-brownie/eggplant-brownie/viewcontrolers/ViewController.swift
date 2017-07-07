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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    @IBOutlet var tableView: UITableView?
    var delegate: AddMealDelegate?
    var items = Array<Item>()
    var selected = Array<Item>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = Dao().loadItems()
        let newItemButton = UIBarButtonItem(title: "New item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @IBAction func add() {
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal: meal)
            }
        
            if let navigation = self.navigationController {
                navigation.popViewController(animated: true)
            } else {
                AlertView(controller: self).show(message: "Unexpected error, but the meal was added.")
            }
        } else {
            AlertView(controller: self).show()
        }
    }
    
    func getMealFromForm() -> Meal? {
        if (nameField == nil || happinessField == nil) {
            return nil
        }
        
        let name = nameField!.text
        let happinessS = happinessField!.text
        if (happinessS == nil || name == nil) {
            return nil
        }
        let happiness = Int(happinessS!)
        if (happiness == nil) {
            return nil
        }
        
        let meal = Meal(name: name!, happiness: happiness!)
        meal.items = selected
        
        return meal
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
    
    @IBAction func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            AlertView(controller: self).show()
        }
        
    }
    
    func addNew(item: Item) {
        items.append(item)
        Dao().save(items: items)
        if let table = tableView {
            table.reloadData()
        } else {
            AlertView(controller: self).show(message: "Unexpected error, but the item was added.")
        }
    }
    

}

