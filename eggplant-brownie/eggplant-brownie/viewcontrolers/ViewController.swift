//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 01/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!

    @IBAction func add() {
        let name = nameField.text;
        let happiness = happinessField.text;
        print("eaten: \(name) \(happiness)!");
    }


}

