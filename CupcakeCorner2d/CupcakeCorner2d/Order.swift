//
//  Order.swift
//  CupcakeCorner2d
//
//  Created by Janice on 6/18/24.
//

import Foundation

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _addSprinkles = "addSprinkles"
        case _extraFrosting = "extraFrosting"
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
        case _name = "name"
    }
    
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
    
    var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    var streetAddress: String {
        didSet {
            UserDefaults.standard.set(streetAddress, forKey: "streetAddress")
        }
    }
    
    var city: String {
        didSet {
            UserDefaults.standard.set(city, forKey: "city")
        }
    }
    
    var zip: String {
        didSet {
            UserDefaults.standard.set(zip, forKey: "zip")
        }
    }
    
    var hasValidAddress: Bool {
        if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty {
            return true
        }
        return false
    }
    
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity * 2)
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50 per cake for extra sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost 
    }
    
    init() {
        name = UserDefaults.standard.string(forKey: "name") ?? ""
        streetAddress = UserDefaults.standard.string(forKey: "streetAddress") ?? ""
        city = UserDefaults.standard.string(forKey: "city") ?? ""
        zip = UserDefaults.standard.string(forKey: "zip") ?? ""
    }
}
