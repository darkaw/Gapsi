//
//  ProductsCell.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import UIKit

class ProductsCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelPlace: UILabel!
    @IBOutlet weak var img: UIImageView!
    
   func configureWithItem(item: Record) {
    labelTitle?.text = item.productDisplayName
       
       let pictureURL = URL(string: item.smImage)!
       let pictureData = NSData(contentsOf: pictureURL as URL)
       let image = UIImage(data: pictureData! as Data)
      
       
       labelPrice.text = "Precio : $\(item.listPrice)"
       labelTitle.text = item.productDisplayName
       labelPlace.text = item.seller
       img.image = image
   }
}
