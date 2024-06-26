//
//  AddBookView.swift
//  Bookworm
//
//  Created by Janice on 6/16/24.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("name of book", text: $title)
                    TextField("author's name", text: $author)
                    
                    Picker("genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Section {
                        TextEditor(text: $review)
                        RatingView(rating: $rating)
                    } header: {
                        Text("write a review")
                    }
                    
                    Section {
                        Button("save") {
                            let newBook = Book(context: moc)
                            newBook.id = UUID()
                            newBook.title = title
                            newBook.author = author
                            newBook.rating = Int16(rating)
                            newBook.genre = genre
                            newBook.review = review
                            
                            try? moc.save()
                            dismiss()
                        }
                    }
                }
                .navigationTitle("Add book")
            }
            
            
        }
    }
}

#Preview {
    AddBookView()
}
