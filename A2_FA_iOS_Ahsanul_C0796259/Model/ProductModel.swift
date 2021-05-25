//
//  ProductModel.swift
//  A2_FA_iOS_Ahsanul_C0796259
//
//  Created by Ahsanul Kabir on 25/5/21.
//  Copyright © 2021 Ahsanul Kabir. All rights reserved.
//

import Foundation
class ProductModel
{
    internal init(id: Int, name: String, desc: String, price: Double, provider: String) {
        self.id = id
        self.name = name
        self.desc = desc
        self.price = price
        self.provider = provider
    }
    
    var id: Int
    var name: String
    var desc: String
    var price: Double
    var provider: String
    
    
}
