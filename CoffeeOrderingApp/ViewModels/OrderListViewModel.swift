//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Òscar Muntal on 7/4/23.
//

import Foundation

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    func fetchOrders() {
        Webservice().getAllOrders { orders in
            guard let orders = orders else { return }
            self.orders = orders.map(OrderViewModel.init)
        }
    }
}


class OrderViewModel {
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        order.name
    }
    
    var size: String {
        order.size
    }
    
    var coffeeName: String {
        order.coffeeName
    }
    
    var total: Double {
        order.total
    }
}
