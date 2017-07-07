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


class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesFied: UITextField?
    let delegate: AddAnItemDelegate?
    
    
    init(delegate: AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.delegate = nil
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
