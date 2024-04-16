//
//  ExpenseSection.swift
//  Expenses3
//
//  Created by Janice on 4/16/24.
//
  import Foundation
import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack {
                        Text("\(item.name)")
                            .font(.headline)
                        Text("\(item.type)")
                    }
                    Spacer()
                    Text(item.amount, format: .currency(code: localCurrency))
                        .style(for: item)
                        .fontColor(for: item)
                }
            }.onDelete(perform: deleteItems)
        }
    }
}

