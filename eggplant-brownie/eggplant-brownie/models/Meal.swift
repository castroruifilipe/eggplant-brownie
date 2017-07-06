//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 03/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import Foundation


class Meal {
    
    let name : String
    let happiness : Int
    var items = Array<Item>()
    
    
    init(name : String, happiness : Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCallories() -> Double {
        print("calculating")
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(self.happiness)"
        for item in self.items {
            message += "\n * \(item.name) - calories: \(item.calories)"
        }
        return message
    }
}
