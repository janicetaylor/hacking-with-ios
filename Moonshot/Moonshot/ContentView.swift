//
//  ContentView.swift
//  Moonshot
//
//  Created by Janice on 4/18/24.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 20, maximum: 80)),
        GridItem(.adaptive(minimum: 20, maximum: 80)),
        GridItem(.adaptive(minimum: 20, maximum: 80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("item \($0)")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
