//
//  Bookworm3App.swift
//  Bookworm3
//
//  Created by Janice on 6/19/24.
//

import SwiftData
import SwiftUI

@main
struct Bookworm3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
