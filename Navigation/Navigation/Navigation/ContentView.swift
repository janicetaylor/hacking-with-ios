//
//  ContentView.swift
//  Navigation
//
//  Created by Janice on 5/13/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("number: \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("creating detail view \(number)")
    }
}

struct ContentView: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
           DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
        }
    }
}

#Preview {
    ContentView()
}
