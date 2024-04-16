//
//  ContentView.swift
//  Animations
//
//  Created by Janice on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationCount = 1.0
    
    var body: some View {
        Button("tap me") {
            animationCount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationCount)
        .animation(.spring(duration: 1, bounce: 0.9), value: animationCount)
        .blur(radius: (animationCount-1) * 3)
    }
}

#Preview {
    ContentView()
}
