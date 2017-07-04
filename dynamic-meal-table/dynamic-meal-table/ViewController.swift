//
//  ViewController.swift
//  dynamic-meal-table
//
//  Created by Rui Leite on 04/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    
    let meals = ["eggplant brownie", "zucchini muffin"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load");
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = meal
        
        return cell
    }

}

