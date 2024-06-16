//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Janice on 6/14/24.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: ""), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("your total is: \(order.cost, format: .currency(code: "USD"))").font(.title)
                
                Button("Place order:", action: { })
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("ok") { }
        } message: {
            Text("confirmation message")
        }
    }
    
    func placeOrder() async {
        Button("place order") {
            Task {
                await placeOrder()
            }
        }
        .padding()
        
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("failed to encode order")
            return
        }
        
        let url = URL(string: "")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, request) = try await URLSession.shared
                .upload(for: request, from: encoded)
            // handle result
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "your order for \(decodedOrder.quantity)x\(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way"
            showingConfirmation = true
        } catch {
            print("checkout failed")
        }
        
        
    }
}

#Preview {
    CheckoutView(order: Order())
}
