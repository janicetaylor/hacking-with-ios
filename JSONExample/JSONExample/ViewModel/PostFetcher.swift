//
//  PostViewModel.swift
//  JSONExample
//
//  Created by Janice on 4/19/24.
//

import Foundation

class PostFetcher: ObservableObject {
    
    @Published var posts: [Post] = []
            
    init() { }
    
    @MainActor
    func fetchPosts() async throws {
        let endpoint = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: endpoint) else {
            throw PostFetcherError.invalidUrl
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PostFetcherError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            posts = try decoder.decode([Post].self, from: data)
        } catch {
            throw PostFetcherError.invalidJSONDecode
        }
        
        enum PostFetcherError: Error {
            case invalidUrl
            case invalidResponse
            case invalidJSONDecode
        }
        
    }
   
    
    
    
}
