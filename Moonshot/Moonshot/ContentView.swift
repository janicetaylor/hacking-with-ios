//
//  ContentView.swift
//  Moonshot
//
//  Created by Janice on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout, content: {
                    ForEach(0..<1000) {
                        Text("row \($0)")
                            .font(.title)
                    }
                })
            }
        }
    }
}


#Preview {
    ContentView()
}
