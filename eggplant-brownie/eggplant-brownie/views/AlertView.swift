//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Rui Leite on 06/07/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import Foundation
import UIKit


class AlertView {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    
    func show(message: String = "Unexpected error.") {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
