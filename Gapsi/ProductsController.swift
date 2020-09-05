//
//  ProductsController.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import UIKit
class ProductsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var tableProducts:UITableView!
    
    var products = [Record]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableProducts.delegate = self
        tableProducts.dataSource = self
        initialSetup()
        fetchData(product: "juguete")
    }
    
    fileprivate func fetchData(product:String) {
        Service.shared.fetchProducts(search: product, initPage: 1, items: 10) { (products, error) in
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
        let pictureURL = URL(string: product.smImage)!
        let pictureData = NSData(contentsOf: pictureURL as URL)
        let image = UIImage(data: pictureData! as Data)
       
        
        cell.labelPrice.text = "Precio : $\(product.listPrice)"
        cell.labelTitle.text = product.productDisplayName
        cell.labelPlace.text = product.seller
        cell.img.image = image
        return cell
    }
    
    
    
    fileprivate func initialSetup(){
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func editingDidEnd(_ sender: Any) {
        fetchData(product: textSearch.text!)
    }
    
    @IBAction func pressBtnSearch(_ sender: Any) {
        fetchData(product: textSearch.text!)
    }
    
  
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

