//
//  Mission.swift
//  Moonshot2
//
//  Created by Janice on 6/8/24.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String 
}

struct Mission: Codable, Identifiable {
    let id: Int
    let description: String
    let launchDate: Date?
    let crew: [CrewRole]
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "n/a"
    }
}
