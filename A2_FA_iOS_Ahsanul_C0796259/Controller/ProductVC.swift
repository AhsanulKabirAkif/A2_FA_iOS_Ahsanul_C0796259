//
//  ProductVC.swift
//  A2_FA_iOS_Ahsanul_C0796259
//
//  Created by Ahsanul Kabir on 25/5/21.
//  Copyright © 2021 Ahsanul Kabir. All rights reserved.
//

import UIKit
import CoreData

class ProductVC: UIViewController {

    @IBOutlet weak var productID: UITextField!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDesc: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productProvider: UITextField!
    
    var editMode: Bool = false
          
        var selectedProduct: Product? {
             didSet {
                 editMode = true
             }
         }
        
        
        weak var delegate: ProductTVC?
        
      
        override func viewDidLoad() {
            super.viewDidLoad()

            


        }
        

        override func viewWillDisappear(_ animated: Bool) {
            
            
               if editMode {
                  delegate!.deleteProduct(product: selectedProduct!)
              }
            guard productName.text != "" else {return}
            delegate!.updateProduct(with: productName.text!, id: Int(productID.text!)!, desc: productDesc.text!, price: Int(productPrice.text!)!, provider: productProvider.text! )
        
            
            
            
        
    }

}
