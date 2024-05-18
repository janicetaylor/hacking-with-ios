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
        Text("detail view: \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("creating detail view: \(number)")
    }
}

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                    Text("selected: \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
