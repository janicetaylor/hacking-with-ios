//
//  ContentView.swift
//  Moonshot2
//
//  Created by Janice on 6/8/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Text("\(astronauts.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
