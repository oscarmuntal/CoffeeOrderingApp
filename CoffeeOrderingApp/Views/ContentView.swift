//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Òscar Muntal on 7/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        NavigationView {
            OrderListView(orders: orderListVM.orders)
                .navigationBarTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
