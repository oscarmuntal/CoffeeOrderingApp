//
//  Webservice.swift
//  CoffeeOrderingApp
//
//  Created by Òscar Muntal on 7/4/23.
//

import Foundation
import SwiftUI

class Webservice {
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, respose, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
        }.resume()
    }
}
