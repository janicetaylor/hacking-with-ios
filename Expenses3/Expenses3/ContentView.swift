//
//  ContentView.swift
//  Expenses3
//
//  Created by Janice on 4/16/24.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    Text(item.name)
                }.onDelete(perform:removeItems)
            }
            .navigationTitle("Expenses")
            .toolbar {
                Button("add expenses", systemImage: "plus") {
                    showingAddExpense = true 
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}


