//
//  ContentView.swift
//  WeSplit
//
//  Created by Janice on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let total = checkAmount + tipValue
        let amountPerPerson = total / peopleCount
        return amountPerPerson
    }
    var originalAmount: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let total = checkAmount + tipValue
        return total
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Check cost") {
                    TextField("amount", value: $checkAmount,
                              format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .focused($amountIsFocused)
                    .keyboardType(.decimalPad)
                    
                    
                    Picker("number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much tip do you want to leave?") {
                    Picker("tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total amount") {
                    Text(originalAmount, format: .currency(code: Locale
                        .current.currency?.identifier ?? "USD"))
                }
            }
        }
        .navigationTitle("WeSplit")
        .toolbar {
                Button("Done") {
                        amountIsFocused = false
                    }
                }
    }
    
}

#Preview {
    ContentView()
}
