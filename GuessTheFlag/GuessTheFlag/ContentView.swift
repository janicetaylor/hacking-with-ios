//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Janice on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    
    var body: some View {
        
            VStack(spacing: 30) {
            VStack {
                    Text("Guess the flag").font(.largeTitle.weight(.bold))
                    Text("Tap the flag of: ").foregroundStyle(.red)
                    Text(countries[correctAnswer])
                }
            }
            ForEach(0..<3) { number in
                Button {
                    flagTapped(number)
                } label: {
                    Image(countries[number])
                        .border(.black)
                }
            }.alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("your score is ???")
            }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
