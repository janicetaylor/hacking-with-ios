//
//  ContentView.swift
//  Expenses
//
//  Created by Janice on 4/16/24.
//

import SwiftUI
import Observation

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    
    @State private var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            Button("show sheet") {
                // show second view
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet, content: {
                SecondView(name: "\(user.firstName) \(user.lastName)")
            })
        }
        .padding()
    }
}

struct SecondView: View {
    
    let name: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("\(name)")
        Button("dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ContentView()
}
