//
//  DetailView.swift
//  Bookworm3
//
//  Created by Janice on 6/21/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
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
        
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
       
        
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "test book", author: "test author", genre: "test genre", review: "test review", rating: 4)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("failed to create preview: \(error.localizedDescription)")
    }
}
