//
//  ContentView.swift
//  SwiftDataProject1
//
//  Created by Janice on 6/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        if user.name.localizedStandardContains("R") {
              if user.city == "London" {
                  return true
              } else {
                  return false
              }
          } else {
              return false
          }
    }, sort: \User.name)
    var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now)
                    let second = User(name: "Miranda Lambert", city: "Houston", joinDate: .now)
                    let third = User(name: "Blake Shelton", city: "Los Angeles", joinDate: .now)
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
