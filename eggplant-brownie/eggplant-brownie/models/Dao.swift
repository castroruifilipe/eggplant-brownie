//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 07/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import Foundation


class Dao {
    
    let mealsArchive: String
    let itemsArchive: String
    
    
    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0] as String
        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func save(meals: Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func save(items: Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: mealsArchive) {
            return loaded as! Array
        } else {
            return Array<Meal>()
        }
    }
    
    func loadItems() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: itemsArchive) {
            return loaded as! Array
        } else {
            return Array<Item>()
        }
    }
}
