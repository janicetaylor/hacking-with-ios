//
//  ContentView.swift
//  Instafilter1
//
//  Created by Janice on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("tap to import a photo"))
                }
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                
                HStack {
                    Button("Change filter", action: changeFilter)
                    Spacer()
                    
                    // share the picture
                }
            }
            .navigationTitle("Instafilter")
            .padding([.horizontal, .bottom])
        }
        
    }
    
    func changeFilter() {
        
    }
    
   
}

#Preview {
    ContentView()
}
