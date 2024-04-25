//
//  ContentView.swift
//  JSONExample2
//
//  Created by Janice on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userFetcher = UserFetcher()
    
    var body: some View {
        VStack {
            List {
                ForEach(userFetcher.users) { user in
                    VStack(alignment: .leading) {
                        Text("name: \(user.name)")
                        Text("username: \(user.username)")
                        Text("email: \(user.email)")
                        Text("address: \(user.address.street) \(user.address.suite) \(user.address.city) \(user.address.zipcode) \(user.address.zipcode)")
                        Text("phone: \(user.phone)")
                        Text("website: \(user.website)")
                    }
                }
            }
        }
        .task {
            try? await userFetcher.fetchUsers()
        }
        
    }
}

#Preview {
    ContentView()
}
