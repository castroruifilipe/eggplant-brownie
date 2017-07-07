//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 05/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit


protocol AddAnItemDelegate {
    func addNew(item: Item)
}


class NewItemViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesFied: UITextField?
    let delegate: AddAnItemDelegate?
    
    
    init(delegate: AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemView", bundle: nil)
        nameField?.delegate = self
        caloriesFied?.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.delegate = nil
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addNewItem() {
        if (nameField == nil || caloriesFied == nil) {
            return
        }
        let name = nameField!.text
        let caloriesS = caloriesFied!.text
        if (caloriesS == nil || name == nil) {
            return
        }
        
        let calories = Double(caloriesS!)
        if (calories == nil) {
            return
        }
        
        let item = Item(name: name!, calories: calories!)
        
        if (delegate == nil) {
            return
        }
        delegate!.addNew(item: item)

        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

}
