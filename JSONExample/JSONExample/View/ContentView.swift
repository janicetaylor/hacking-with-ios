//
//  ContentView.swift
//  JSONExample
//
//  Created by Janice on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var postFetcher = PostFetcher()
    
    var body: some View {
        VStack {
            List {
                ForEach(postFetcher.posts) { post in
                    HStack {
                        AsyncImage(url: URL(string: "\(post.thumbnailUrl)"))
                        Text("\(post.title)")
                    }
                }
            }
        }
        .padding()
        .task {
            try? await postFetcher.fetchPosts()
        }
        .refreshable {
            try? await postFetcher.fetchPosts()
        }
    }
}

#Preview {
    ContentView(postFetcher: PostFetcher())
}
