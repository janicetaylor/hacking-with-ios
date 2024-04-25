//
//  postFetcher.swift
//  JSONExample2
//
//  Created by Janice on 4/25/24.
//

import Foundation

class UserFetcher: ObservableObject {
    
    @Published var users: [User] = []
    
    init() { }
    
    @MainActor
    func fetchUsers() async throws {
        
        let endpoint = "https://jsonplaceholder.typicode.com/users"
        
        // 1 - create url
        
        guard let url = URL(string: endpoint) else {
            print("invalid url")
            throw UserFetcherError.InvalidURL
        }
        
        // 2 - session
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // 3 - did we get response?
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("invalid url response")
            throw UserFetcherError.InvalidURLResponse
        }
        
        // 4 - decode json
        
        do {
            let decoder = JSONDecoder()
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("invalid json decode")
            throw UserFetcherError.InvalidJSONDecode
        }
                
    }
    
    enum UserFetcherError: Error {
        case InvalidURL
        case InvalidURLResponse
        case InvalidJSONDecode
    }
    
}
