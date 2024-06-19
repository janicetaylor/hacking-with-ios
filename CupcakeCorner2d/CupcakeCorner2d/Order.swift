//
//  Order.swift
//  CupcakeCorner2d
//
//  Created by Janice on 6/18/24.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false 
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false 
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}
