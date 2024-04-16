//
//  ContentView.swift
//  WorkScramble
//
//  Created by Janice on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
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
            .alert(errorTitle, isPresented: $showingError) {
                Button("Ok") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        // lowercase and trim the word, make sure we don't add duplicates
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if string is empty
        guard answer.count > 0 else { return }
        
        // extra validation
        guard isDefaultWord(word: answer) else {
            wordError(title: "Word is default word", message: "Enter in a new word")
            return
        }
        
        guard isWordCountOverMinimum(word: answer) else {
            wordError(title: "Word is too short", message: "Enter in words over 3 characters")
            return 
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word already used", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not real", message: "You can't make up random words!!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func isDefaultWord(word: String) -> Bool {
        if (word == "silkworm") {
            return false
        }
        return true
    }
    
    func isWordCountOverMinimum(word: String) -> Bool {
        if word.count <= 3 {
            return false
        }
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        // loop through letters in word and compare
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
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
