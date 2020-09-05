//
//  ProductsController.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import UIKit
class ProductsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableProducts:UITableView!
    
    var products = [Record]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableProducts.delegate = self
        tableProducts.dataSource = self
        initialSetup()
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchProducts(search: "bicicleta", initPage: 1, items: 10) { (products, error) in
            if let err = error {
                print("Failed to fetch product:", err)
                return
            }
            self.products = products?.plpResults.records ?? []
           
            self.tableProducts.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableProducts.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductsCell
        let product = products[indexPath.row]
       
        cell.labelPrice.text = "$\(product.listPrice)"
        cell.labelTitle.text = product.productDisplayName
        return cell
    }
    
    
    
    fileprivate func initialSetup(){
        
    }
    
   
    
}



