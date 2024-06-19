//
//  ContentView.swift
//  CupcakeCorner2b
//
//  Created by Janice on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("username", text: $username)
                TextField("email", text: $email)
            }
            
            Section {
                Button("create account") {
                    print("creating account...")
                }
            }
            .disabled(username.isEmpty || email.isEmpty)
        }
        .disabled(disableForm)
    }
}

#Preview {
    ContentView()
}
