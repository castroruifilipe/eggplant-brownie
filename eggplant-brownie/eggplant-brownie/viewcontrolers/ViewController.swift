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

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    var delegate: AddMealDelegate?
    

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
        print("eaten: \(meal.name) \(meal.happiness)!");
        
        if (delegate == nil) {
            return
        }
        delegate!.add(meal: meal)
        
        if let navigation = self.navigationController {
            navigation.popViewController(animated: true)
        }
    }


}

