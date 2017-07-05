//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 04/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit


class MealsTableViewController: UITableViewController {

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
        let meal = meals[ row ]
        var cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
    
}