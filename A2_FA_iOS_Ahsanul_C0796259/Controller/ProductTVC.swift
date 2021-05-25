//
//  ProductTVC.swift
//  A2_FA_iOS_Ahsanul_C0796259
//
//  Created by Ahsanul Kabir on 25/5/21.
//  Copyright © 2021 Ahsanul Kabir. All rights reserved.
//

import UIKit
import CoreData


class ProductTVC: UITableViewController {

    
   var products = [Product]()
    
   
    
    
    
    // create the context
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
     // define a search controller
     let searchController = UISearchController(searchResultsController: nil)
     

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = false
        
        
       
        let newProduct = Product(context: self.context)
        newProduct.id = 1
        newProduct.name = "Lenovo"
        newProduct.desc = "Laptop"
        newProduct.price = 250
        newProduct.provider = "Lenovo"
        self.products.append(newProduct)
        self.saveProducts()
     
        let newProduct2 = Product(context: self.context)
        newProduct2.id = 2
        newProduct2.name = "Xbox"
        newProduct2.desc = "Console"
        newProduct2.price = 300
        newProduct2.provider = "Microsoft"
        self.products.append(newProduct2)
        self.saveProducts()
        
        let newProduct3 = Product(context: self.context)
        newProduct3.id = 3
        newProduct3.name = "Mouse"
        newProduct3.desc = "Small mouse"
        newProduct3.price = 50
        newProduct3.provider = "Gigabyte"
        self.products.append(newProduct3)
        self.saveProducts()
        
        let newProduct4 = Product(context: self.context)
        newProduct4.id = 4
        newProduct4.name = "Keyboard"
        newProduct4.desc = "Small keyboard"
        newProduct4.price = 50
        newProduct4.provider = "Gigabyte"
        self.products.append(newProduct4)
        self.saveProducts()
        
        let newProduct5 = Product(context: self.context)
        newProduct5.id = 5
        newProduct5.name = "Xiaomi note 4x"
        newProduct5.desc = "mobile"
        newProduct5.price = 250
        newProduct5.provider = "Xiaomi"
        self.products.append(newProduct5)
        self.saveProducts()
        
        let newProduct6 = Product(context: self.context)
        newProduct6.id = 6
        newProduct6.name = "Xiaomi note 7 pro"
        newProduct6.desc = "mobile"
        newProduct6.price = 350
        newProduct6.provider = "Xiaomi"
        self.products.append(newProduct6)
        self.saveProducts()
        
        let newProduct7 = Product(context: self.context)
        newProduct7.id = 7
        newProduct7.name = "Body Lotion"
        newProduct7.desc = "Lotion"
        newProduct7.price = 35
        newProduct7.provider = "Activ"
        self.products.append(newProduct7)
        self.saveProducts()
        
        let newProduct8 = Product(context: self.context)
        newProduct8.id = 8
        newProduct8.name = "Iphone 12"
        newProduct8.desc = "Mobile"
        newProduct8.price = 35
        newProduct8.provider = "Apple"
        self.products.append(newProduct8)
        self.saveProducts()
        
        let newProduct9 = Product(context: self.context)
        newProduct9.id = 9
        newProduct9.name = "KZ Zs3"
        newProduct9.desc = "Headphone"
        newProduct9.price = 74
        newProduct9.provider = "Mi"
        self.products.append(newProduct9)
        self.saveProducts()
        
        let newProduct10 = Product(context: self.context)
        newProduct10.id = 10
        newProduct10.name = "Mi pro"
        newProduct10.desc = "Headphone"
        newProduct10.price = 73
        newProduct10.provider = "Mi"
        self.products.append(newProduct10)
        self.saveProducts()
        
        
       showSearchBar()
//
//      let delegate = UIApplication.shared.delegate as! AppDelegate
//      let context = delegate.persistentContainer.viewContext

     
       
//        loadProducts()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    override func viewWillAppear(_ animated: Bool) {
           tableView.reloadData()
       }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
         let product = products[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = product.provider
    
        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
       // Override to support editing the table view.
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               // Delete the row from the data source
               
               deleteProduct(product: products[indexPath.row])
               saveProducts()
               products.remove(at: indexPath.row)
                          // Delete the row from the data source
                          
               tableView.deleteRows(at: [indexPath], with: .fade)
               
               
           } else if editingStyle == .insert {
               // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
           }
       }
       
    
    func showSearchBar() {
           searchController.searchBar.delegate = self
           searchController.obscuresBackgroundDuringPresentation = false
           searchController.searchBar.placeholder = "Search Product"
           navigationItem.searchController = searchController
           definesPresentationContext = true
           searchController.searchBar.searchTextField.textColor = .lightGray
       }
    
    
    func saveProducts(){
        do {
                  try context.save()
                  tableView.reloadData()
              } catch {
                  print("Error saving the folder \(error.localizedDescription)")
              }
    }
    
    
    func deleteProduct(product: Product) {
             context.delete(product)
         }

    
 /// load folder from core data
  func loadProducts(predicate: NSPredicate? = nil) {
      let request: NSFetchRequest<Product> = Product.fetchRequest()
      request.predicate = predicate
      request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
      do {
          products = try context.fetch(request)
      } catch {
          print("Error loading products \(error.localizedDescription)")
      }
      tableView.reloadData()
  }
  
    func deleteAllRecords(){
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
             let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

             do {
                 try context.execute(deleteRequest)
                 try context.save()
             } catch {
                 print ("There was an error")
             }
    }
    
   
    
    
    

}
 

//MARK: - search bar delegate methods
extension ProductTVC: UISearchBarDelegate {
    
    
    /// search button on keypad functionality
    /// - Parameter searchBar: search bar is passed to this function
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // add predicate
        let predicate = NSPredicate(format: "name == %@", searchBar.text!)
        loadProducts(predicate : predicate)
    }
    
    
    /// when the text in text bar is changed
    /// - Parameters:
    ///   - searchBar: search bar is passed to this function
    ///   - searchText: the text that is written in the search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadProducts()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
}
