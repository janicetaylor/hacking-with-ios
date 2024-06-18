//
//  DetailView.swift
//  Bookworm
//
//  Created by Janice on 6/18/24.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "fantasy")
                    .resizable()
                    .scaledToFit()

                Text(book.genre?.uppercased() ?? "Fantasy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "unknown author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "no review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "unknown book")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        return NavigationView {
            DetailView(book: book)
        }
    }
}
