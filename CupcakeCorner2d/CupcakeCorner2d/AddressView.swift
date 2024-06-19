//
//  AddressView.swift
//  CupcakeCorner2d
//
//  Created by Janice on 6/18/24.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("name", text: $order.name)
                TextField("street address", text: $order.streetAddress)
                TextField("city", text: $order.city)
                TextField("zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("check out") {
                    CheckoutView(order: order)
                }
            }
        }
    }
}

#Preview {
    AddressView(order: Order())
}
