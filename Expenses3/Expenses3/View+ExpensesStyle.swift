//
//  View+ExpensesStyle.swift
//  Expenses3
//
//  Created by Janice on 4/16/24.
//

import Foundation
import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.body)
        } else {
            return self.font(.body)
        }
    }
    
    func fontColor(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.foregroundStyle(.gray)
        } else if item.amount < 100 {
            return self.foregroundStyle(.gray)
        } else {
            return self.foregroundStyle(.red)
        }
    }
}
