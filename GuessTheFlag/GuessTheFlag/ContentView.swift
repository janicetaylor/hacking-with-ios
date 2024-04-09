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
    @State private var score = 0
    @State private var levelTracker = 0
    @State private var isEndGame = false
    
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
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("your score is \(score) level: \(levelTracker)")
        }
        .alert("Game over!", isPresented: $isEndGame) {
            Button("Reset game", action: resetGame)
        } message: {
            Text("Thank you for playing! your score is: \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score = score + 1
        } else {
            scoreTitle = "Wrong! that's the flag of \(countries[number])"
            if (score > 0) {
                score = score - 1;
            } else {
                scoreTitle = "Wrong! that's the flag of \(countries[number])"
            }
        }
        showingScore = true
        levelTracker = levelTracker + 1
        
        if levelTracker >= 8 {
            showingScore = false
            isEndGame = true
        }
    }
    
    func resetGame() {
        levelTracker = 0
        isEndGame = false
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
