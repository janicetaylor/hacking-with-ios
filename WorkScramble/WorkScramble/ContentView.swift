//
//  ContentView.swift
//  WorkScramble
//
//  Created by Janice on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var usedWords = [String]()
    @State var rootWord = ""
    @State var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("enter your word: ", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
        }
    }
    
    func addNewWord() {
        // lowercase and trim the word, make sure we don't add duplicates
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if string is empty
        guard answer.count > 0 else { return }
        
        // extra validation
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        // 1 - find the url for start.txt
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2 - load start.txt into a string
            if let startWords = try? String(contentsOf: startWordURL) {
                // 3 - split the string into an array of strings, split on line break
                let allWords = startWords.components(separatedBy: "\n")
                // 4 - pick one random word by default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // if everything is done, we can wait
                return
            }
        }
        fatalError("could not load start.txt from Bundle")
    }
    
}

#Preview {
    ContentView()
}
