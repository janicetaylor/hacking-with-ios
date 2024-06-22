//
//  SwiftDataProject1App.swift
//  SwiftDataProject1
//
//  Created by Janice on 6/22/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProject1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
