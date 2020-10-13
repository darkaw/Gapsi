//
//  Service.swift
//  Gapsi
//
//  Created by Darkaw on 05/09/20.
//  Copyright © 2020 dr. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchProducts(search:String, initPage:Int, items:Int, completion: @escaping (Product?, Error?) -> ()) {
        let urlString = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?force-plp=true&search-string=\(search)&page-number=\(initPage)&number-of-items-per-page=\(items)"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch product:", err)
                return
            }
            
            guard let data = data else { return }
            do {
                let jsondata = try JSONDecoder().decode(Product.self, from: data)
                
                DispatchQueue.main.async {
                    completion(jsondata, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
