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
            return self.font(.title3)
        } else {
            return self.font(.title)
            
        }
    }
    
}
