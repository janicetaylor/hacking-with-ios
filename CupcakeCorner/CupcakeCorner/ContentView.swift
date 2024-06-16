//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Janice on 6/14/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
                Form {
                    Section {
                        Picker("select your cake type", selection: $order.type) {
                            ForEach(Order.types.indices) {
                                Text(Order.types[$0])
                            }
                        }
                        
                        Stepper("number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                    }
                    
                    Section {
                        Toggle("any special requests?", isOn: $order.specialRequestEnabled.animation())
                        
                        if order.specialRequestEnabled {
                            Toggle("add extra frosting", isOn: $order.extraFrosting)
                            Toggle("add extra sprinkles", isOn: $order.addSprinkles)
                        }
                    }
                    
                    Section {
                        NavigationLink {
                            AddressView(order: order)
                        } label: {
                            Text("delivery details")
                        }
                    }
                }
        }
        .navigationTitle("Cupcake Corner")
    }
}
    
    

#Preview {
    ContentView()
}
