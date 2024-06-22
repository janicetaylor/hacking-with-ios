//
//  DetailView.swift
//  Bookworm3
//
//  Created by Janice on 6/21/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .padding(10)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.date.formatted(date: .abbreviated, time: .omitted))
                .font(.title)
        
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "test book", author: "test author", genre: "test genre", review: "test review", rating: 4, date: .now)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("failed to create preview: \(error.localizedDescription)")
    }
}
