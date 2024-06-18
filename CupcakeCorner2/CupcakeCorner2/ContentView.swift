//
//  ContentView.swift
//  CupcakeCorner2
//
//  Created by Janice on 6/18/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
    
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        // 1 - url
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("invalid url")
            return
        }
        
        // 2 - fetch
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            
        } catch {
            print("invalid data")
        }
        
        // 3 - decode
    }
}

#Preview {
    ContentView()
}
