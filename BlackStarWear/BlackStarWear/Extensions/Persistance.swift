//
//  Persistance.swift
//  BlackStarWear
//
//  Created by Sergey on 7/22/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import Foundation

class Persisitance {
    static let shared = Persisitance()
    
    private let kProductNameKey = "Persisitance.kProductNameKey"
    private let kProductSizeKey = "Persisitance.kProductSizeKey"
    private let kProductPriceKey = "Persisitance.kProductPriceKey"
    private let kProductImageKey = "Persisitance.kProductImageKey"
    
    var productName: [String] {
        set { UserDefaults.standard.set(newValue, forKey: kProductNameKey) }
        get { return UserDefaults.standard.stringArray(forKey: kProductNameKey) ?? []}
    }
    
    var productSize: [String] {
        set { UserDefaults.standard.set(newValue, forKey: kProductSizeKey) }
        get { return UserDefaults.standard.stringArray(forKey: kProductSizeKey) ?? []}
    }
    
    var productPrice: [String] {
        set { UserDefaults.standard.set(newValue, forKey: kProductPriceKey) }
        get { return UserDefaults.standard.stringArray(forKey: kProductPriceKey) ?? []}
    }
    
    var productImage: [String] {
        set { UserDefaults.standard.set(newValue, forKey: kProductImageKey) }
        get { return UserDefaults.standard.stringArray(forKey: kProductImageKey) ?? []}
    }
    
}
