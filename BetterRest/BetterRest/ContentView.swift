//
//  ContentView.swift
//  BetterRest
//
//  Created by Janice on 4/10/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    Spacer()
                    DatePicker("Please enter a time:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
           
                HStack {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Spacer()
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                }
                
                HStack {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Spacer()
                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in:  1...20)
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action:  calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("ok") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(input: SleepCalculatorInput(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount))))
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is: "
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showingAlert = true
    }
    
}

#Preview {
    ContentView()
}
