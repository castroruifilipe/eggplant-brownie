//
//  Item.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 03/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import Foundation


class Item : Equatable {
    
    let name : String
    let calories : Double
    
    
    init(name : String, calories : Double) {
        self.name = name
        self.calories = calories
    }
    
}

func ==(first: Item, second:Item) -> Bool {
    return (first.name == second.name) && (first.calories == second.calories)
}
