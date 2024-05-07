//
//  AstronautView.swift
//  Moonshot
//
//  Created by Janice on 5/7/24.
//

import Foundation
import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackround)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
