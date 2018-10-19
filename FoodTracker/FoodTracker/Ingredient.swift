//
//  Ingredient.swift
//  FoodTracker
//
//  Created by Kathryn Blair on 2018-10-10.
//  Copyright © 2018 Kathryn Blair. All rights reserved.
//

import UIKit
import os.log

//

class Ingredient: NSObject, NSCoding {
    
    //MARK: Properties
    enum Units {
        case cups
        case lbs
        case ml
        case l
        case g
        case oz
        case kg
        case tsp
        case tbsp
        case cans
        case pkg
        case jar
    }
    
    var name: String
    var amount: Float?
    var unit: Units?
    
    //MARK: Archiving Paths
    
    // don't think I need this, can probably just include in the Meal
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let amount = "amount"
        static let unit = "unit"
    }
    
    //MARK: Initialization
    
    init?(name: String, amount: Float?, unit: Units?) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        
        // Initialize stored properties.
        self.name = name
        self.amount = amount
        self.unit = unit
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(amount, forKey: PropertyKey.amount)
        aCoder.encode(unit, forKey: PropertyKey.unit)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for an Ingredient object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because amount is an optional property of Ingredient, just use conditional cast.
        let amount = aDecoder.decodeFloat(forKey: PropertyKey.amount)
        
        // Because units is an optional property of Ingredient, just use conditional cast.
        let unit = aDecoder.decodeObject(forKey: PropertyKey.unit) as? Units
        
        // Must call designated initializer.
        self.init(name: name, amount: amount, unit: unit)
    }
}
